//
//  TopQuestionsView.ViewModel.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 22/01/2022.
//

import Foundation

extension TopQuestionsView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        
        func fetchTopQuestions() async -> [Question]? {
            isLoading = true
            defer { isLoading = false }
            let resource = QuestionsResource()
            let request = APIRequest(resource: resource)
            return await request.execute()
        }
    }
}
