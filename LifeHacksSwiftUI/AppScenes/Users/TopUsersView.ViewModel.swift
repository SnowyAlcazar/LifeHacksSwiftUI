//
//  TopUsersView.ViewModel.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 22/01/2022.
//

import Foundation

extension TopUsersView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
                
        func loadUsers() async -> [User]? {
            isLoading = true
            defer { isLoading = false }
            let request = APIRequest(resource: UsersResource())
            return await request.execute()
        }
    }
}
