//
//  ActivityIndicator.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 22/01/2022.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    var isAnimating: Bool = true
    
    func makeUIView(
        context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
            UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(
        _ uiView: UIActivityIndicatorView,
        context: UIViewRepresentableContext<ActivityIndicator>) {
            isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
