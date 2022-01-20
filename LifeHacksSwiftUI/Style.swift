//
//  Style.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import SwiftUI

struct Style: ViewModifier {
    let gradient: LinearGradient
    var filled = true
    
    func body(content: Content) -> some View {
        Group {
            if filled {
                content
                    .background(gradient)
                    .cornerRadius(6.0)
                    .foregroundColor(.white)
            } else {
                content
                    .background(
                        RoundedRectangle(cornerRadius: 6.0)
                            .strokeBorder(gradient, lineWidth: 2.0)
                )
            }
        }
    }
}

extension View {
    func blueStyle() -> some View {
        modifier(Style(gradient: .blue))
    }
    
    func tealStyle() -> some View {
        modifier(Style(gradient: .teal))
    }
    
    func orangeStyle(filled: Bool = true) -> some View {
        modifier(Style(gradient: .orange, filled: filled))
    }
    
    func greenStyle(filled: Bool = true) -> some View {
        modifier(Style(gradient: .green, filled: filled))
    }
}

struct Styles_Previews: PreviewProvider {
    static var stack: some View {
        VStack(spacing: 16) {
            Text("Blue style")
                .padding()
                .blueStyle()
            Text("Orange filled style")
                .padding()
                .orangeStyle()
            Text("Orange empty style")
                .padding()
                .orangeStyle(filled: false)
            Text("Teal style")
                .padding()
                .tealStyle()
            Text("Green style")
                .padding()
                .greenStyle()
            Text("Green empty style")
                .padding()
                .greenStyle(filled: false)
        }
    }
    
    static var previews: some View {
        Group {
            stack
                .padding()
                .previewDisplayName("Light mode")
            stack
                .padding()
                .background(Color(UIColor.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark mode")
        }
        .previewLayout(.sizeThatFits)
    }
}
