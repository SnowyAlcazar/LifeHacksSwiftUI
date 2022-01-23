//
//  TopQuestionsView.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import SwiftUI

// MARK: - TopQuestionsView
struct TopQuestionsView: View {
    @State var questions: [Question]
    
    var body: some View {
        VStack {
            EditButton()
            List {
                ForEach(questions) { question in
                    QuestionRow(question: question)
                }
                .onDelete(perform: deleteItems(atOffsets:))
                .onMove(perform: move(fromOffsets:toOffset:))
            }
            .listStyle(.plain)
        }
    }
    
    func deleteItems(atOffsets offsets: IndexSet) {
        questions.remove(atOffsets: offsets)
    }
    
    func move(fromOffsets source: IndexSet, toOffset destination: Int) {
        questions.move(fromOffsets: source, toOffset: destination)
    }
}

// MARK: - Previews
struct TopQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        TopQuestionsView(questions: TestData.questions)
            .fullScreenPreviews()
    }
}
