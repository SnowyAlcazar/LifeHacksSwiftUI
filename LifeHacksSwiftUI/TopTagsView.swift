//
//  TopTagsView.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import SwiftUI

// MARK: - TopTagsView
struct TopTagsView: View {
    let tags: [Tag]
    
    var body: some View {
        List {
            ForEach(tags) { tag in
                DisclosureGroup {
                    ForEach(tag.questions) { question in
                        QuestionRow(question: question)
                    }
                } label: {
                    Header(title: tag.name, count: tag.count, excerpt: tag.excerpt)
                }
            }
        }
        .listStyle(.plain)
    }
}

// MARK: - Header
extension TopTagsView {
    struct Header: View {
        let title: String
        let count: Int
        let excerpt: String
        
        var body: some View {
            VStack(spacing: 8.0) {
                HStack {
                    Text(title)
                    Spacer()
                    Text("\(count)")
                }
                .font(.headline)
                Text(excerpt)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 8.0)
        }
    }
}

// MARK: - Previews
struct TopTagsView_Previews: PreviewProvider {
    static var previews: some View {
        TopTagsView(tags: TestData.topTags)
    }
}
