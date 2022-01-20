//
//  Theme.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import SwiftUI

struct Theme: Identifiable {
    let name: String
    let accentColor: Color
    let secondaryColor: Color
    let primaryGradient: LinearGradient
    let secondaryGradient: LinearGradient
    
    var id: String { name }
    
    static let `default` = Theme(
        name: "Default",
        accentColor: .blue,
        secondaryColor: .orange,
        primaryGradient: .blue,
        secondaryGradient: .orange)
    
    static let web = Theme(
        name: "Web",
        accentColor: .teal,
        secondaryColor: .green,
        primaryGradient: .teal,
        secondaryGradient: .green)
    
    static let allThemes: [Theme] = [.default, .web]
}
