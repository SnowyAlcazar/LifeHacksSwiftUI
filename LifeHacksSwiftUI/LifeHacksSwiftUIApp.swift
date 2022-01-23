//
//  LifeHacksSwiftUIApp.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import SwiftUI

@main
struct LifehacksApp: App {
    @StateObject private var stateController = StateController()
    @StateObject private var settingsController = SettingsController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(stateController)
                .environmentObject(settingsController)
        }
    }
}

extension LifehacksApp {
    struct Keys {
        static let themeName = "ThemeName"
        static let isLoggedIn = "IsLoggedIn"
    }
}
