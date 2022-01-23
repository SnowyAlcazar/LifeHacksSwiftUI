//
//  SettingsController.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 22/01/2022.
//

import Foundation

class SettingsController: ObservableObject {
    @Published var theme: Theme {
        didSet { defaults.set(theme.name, forKey: LifehacksApp.Keys.themeName) }
    }
    
    private let defaults = UserDefaults.standard
    
    init() {
        let themeName = defaults.string(forKey: LifehacksApp.Keys.themeName) ?? ""
        theme = Theme.named(themeName) ?? .default
    }
}
