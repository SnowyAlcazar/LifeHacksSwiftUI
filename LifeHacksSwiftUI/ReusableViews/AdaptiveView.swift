//
//  AdaptiveView.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 22/01/2022.
//

import SwiftUI

struct AdaptiveView<Standard: View, Large: View>: View {
    let standard: Standard
    let large: Large

    @Environment(\.sizeCategory) private var sizeCategory

    var body: some View {
        Group {
            if sizeCategory.isLarge {
                large
            } else {
                standard
            }
        }
    }
}

// MARK: - ContentSizeCategory
extension ContentSizeCategory {
    var isLarge: Bool {
        let largeCategories: [ContentSizeCategory] = [
            .accessibilityLarge,
            .accessibilityExtraLarge,
            .accessibilityExtraExtraLarge,
            .accessibilityExtraExtraExtraLarge
        ]
        return largeCategories.contains(self)
    }
}

// MARK: - Previews
struct AdaptiveView_Previews: PreviewProvider {
    static let view = AdaptiveView(standard: Text("Standard"), large: Text("Large"))

    static var previews: some View {
        Group {
            view
            view
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
        .previewLayout(.sizeThatFits)
    }
}
