//
//  EditProfileView.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import SwiftUI

// MARK: - EditProfileView
struct EditProfileView: View {
    @State var user: User
    
    var body: some View {
        VStack {
            Header(name: $user.name, avatar: user.avatar)
            AboutMe(text: $user.aboutMe)
            Spacer()
        }
        .padding(20.0)
        .animation(.default, value: user)
    }
}

// MARK: - Header
extension EditProfileView {
    struct Header: View {
        @Binding var name: String
        var avatar: UIImage
        
        var body: some View {
            HStack(alignment: .top) {
                RoundImage(image: avatar, borderColor: .blue)
                    .frame(width: 62.0, height: 62.0)
                VStack(alignment: .leading) {
                    TextField("Name", text: $name)
                    Divider()
                    EditProfileView.ErrorMessage(
                        text: "The name cannot be empty",
                        isVisible: name.isEmpty)
                }
                .padding(.leading, 16.0)
            }
        }
    }
}

// MARK: - AboutMe
extension EditProfileView {
    struct AboutMe: View {
        @Binding var text: String
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("About me:")
                    .font(.callout)
                    .bold()
                TextEditor(text: $text)
                    .frame(height: 200.0)
                EditProfileView.ErrorMessage(
                    text: "The about me cannot be empty",
                    isVisible: text.isEmpty)
            }
        }
    }
}

// MARK: - ErrorMessage
extension EditProfileView {
    struct ErrorMessage: View {
        let text: String
        var isVisible: Bool = false
        
        var body: some View {
            Group {
                if isVisible {
                    Text(text)
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

// MARK: - Previews
struct EditProfileView_Previews: PreviewProvider {
    typealias Header = EditProfileView.Header
    typealias AboutMe = EditProfileView.AboutMe
    typealias ErrorMessage = EditProfileView.ErrorMessage
    
    static let user = TestData.user
    
    static var previews: some View {
        Group {
            EditProfileView(user: user)
            VStack(spacing: 16.0) {
                Header(name: .constant(user.name), avatar: user.avatar)
                Header(name: .constant(""), avatar: user.avatar)
            }
            .previewWithName(String.name(for: Header.self))
            VStack(spacing: 16.0) {
                AboutMe(text: .constant(user.aboutMe))
                AboutMe(text: .constant(""))
            }
            .previewWithName(String.name(for: AboutMe.self))
            ErrorMessage(text: "The name cannot be empty", isVisible: true)
                .namedPreview()
        }
    }
}
