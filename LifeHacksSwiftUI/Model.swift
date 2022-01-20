//
//  Model.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import Foundation
import UIKit

// MARK: - User
struct User: Equatable, Identifiable {
    let id: Int
    var name: String
    var aboutMe: String
    let reputation: Int
    var avatar: UIImage
}

// MARK: - Question
struct Question: Identifiable, Votable {
    let id: Int
    let viewCount: Int
    let answerCount: Int
    let title: String
    let body: String
    let isAnswered: Bool
    let creationDate: Date
    let tags: [String]
    let owner: User
    let comments: [Comment]
    var answers: [Answer]
    var score: Int
    var vote = Vote.none
}

// MARK: - Answer
struct Answer: Identifiable, Votable {
    let id: Int
    let body: String
    let creationDate: Date
    let isAccepted: Bool
    let owner: User
    var score: Int
    var vote = Vote.none
}

// MARK: - Comment
struct Comment: Identifiable {
    let id: Int
    let body: String
    let owner: User
}

// MARK: Tag
struct Tag: Identifiable {
    let id: Int
    let count: Int
    let name: String
    let excerpt: String
    let questions: [Question]
}
