//
//  TopUsersView.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import SwiftUI

// MARK: - TopUsersView
struct TopUsersView: View {
    private let columns = [GridItem(.adaptive(minimum: 180.0))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 24.0) {
                ForEach(TestData.users) { user in
                    Cell(user: user)
                }
            }
            .padding(.top, 24.0)
        }
    }
}

// MARK: - Cell
extension TopUsersView {
    struct Cell: View {
        let name: String
        let reputation: Int
        let avatar: UIImage
        
        var body: some View {
            HStack {
                RoundImage(image: avatar)
                    .frame(width: 37.0, height: 37.0)
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(name)
                        .font(.subheadline)
                        .bold()
                    Text("\(reputation.formatted) reputation")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

extension TopUsersView.Cell {
    init(user: User) {
        name = user.name
        reputation = user.reputation
        avatar = user.avatar
    }
}

// MARK: - Previews
struct TopUsersView_Previews: PreviewProvider {
    static var previews: some View {
        TopUsersView()
    }
}
