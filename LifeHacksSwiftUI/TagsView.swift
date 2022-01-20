//
//  TagsView.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import SwiftUI

struct TagsView: View {
    let tags: [String]
    
    var body: some View {
        Text(tagsString)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
    }
}
 
private extension TagsView {
    var tagsString: String {
        var result = tags.first ?? ""
        for tag in tags.dropFirst() {
            result.append(", " + tag)
        }
        return result
    }
}
 
struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: ["lorem", "ipsum", "dolor", "sit", "amet"])
            .previewLayout(.sizeThatFits)
    }
}
