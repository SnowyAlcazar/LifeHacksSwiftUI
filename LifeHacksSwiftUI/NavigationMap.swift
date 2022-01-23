//
//  NavigationMap.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 22/01/2022.
//

import SwiftUI

struct NavigationMap {
    var destinationForQuestion: ((Question) -> QuestionView)?
    var destinationForUser: ((User) -> ProfileView)?
}

extension NavigationMap {
    struct Key: EnvironmentKey {
        static let defaultValue = NavigationMap()
    }
}

extension EnvironmentValues {
    var navigationMap: NavigationMap {
        get { self[NavigationMap.Key.self] }
        set { self[NavigationMap.Key.self] = newValue  }
    }
}
