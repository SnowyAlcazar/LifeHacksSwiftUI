//
//  Previews.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import SwiftUI

extension View {
    func previewWithName(_ name: String) -> some View {
        self
            .padding()
            .previewLayout(.sizeThatFits)
            .previewDisplayName(name)
    }
    
    func namedPreview() -> some View {
        let name = String.name(for: type(of: self))
        return previewWithName(name)
    }
    
    func fullScreenPreviews() -> some View {
        Group {
            self
            self
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark mode")
            self
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .previewDisplayName("Accessibility XXXL")
            self
                .previewDevice("iPhone SE (2nd generation)")
                .previewDisplayName("iPhone SE (2nd generation)")
        }
    }
}

extension String {
    static func name<T>(for type: T) -> String {
        String(reflecting: type)
            .components(separatedBy: ".")
            .last ?? ""
    }
}
