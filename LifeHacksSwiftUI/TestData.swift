//
//  TestData.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import Foundation

struct TestData {
    static let shortText = "In the tumultuous business of cutting-in and attending to a whale, there is much running backwards and forwards among the crew."
    static let longText = "So strongly and metaphysically did I conceive of my situation then, that while earnestly watching his motions, I seemed distinctly to perceive that my own individuality was now merged in a joint stock company of two; that my free will had received a mortal wound; and that another's mistake or misfortune might plunge innocent me into unmerited disaster and death."
    static let tags = ["monkey", "rope", "found", "all", "whalers"]
    static let user = User(
        id: 0,
        name: "Betty Vasquez",
        aboutMe: longText,
        reputation: 1234,
        avatar: #imageLiteral(resourceName: "Avatar"))
    static let otherUser = makeUser(id: 1)
    static let users = [
        makeUser(id: 1),
        makeUser(id: 2),
        makeUser(id: 3),
        makeUser(id: 4),
        makeUser(id: 5)
    ]
    static var question = makeQuestion(id: 0)
    static let questions = [makeQuestion(id: 1), makeQuestion(id: 2), makeQuestion(id: 3)]
    static let answer = makeAnswer(id: 0, isAccepted: true)
    static let comment = makeComment(id: 0)
    static let tag = makeTag(id: 0)
    static let topTags = [makeTag(id: 1), makeTag(id: 2), makeTag(id: 3)]
    
    static func makeUser(id: Int) -> User {
        User(
            id: id,
            name: "Martin Abasto",
            aboutMe: longText,
            reputation: 986,
            avatar: #imageLiteral(resourceName: "Other"))
    }
    
    static func makeComment(id: Int) -> Comment {
        Comment(id: id, body: longText, owner: otherUser)
    }
    
    static func makeAnswer(id: Int, isAccepted: Bool = false) -> Answer {
        Answer(
            id: id,
            body: longText,
            creationDate: Date(),
            isAccepted: isAccepted,
            owner: otherUser,
            score: 124)
    }
    
    static func makeTag(id: Int) -> Tag {
        Tag(id: id, count: 123, name: "Lorem", excerpt: shortText, questions: questions)
    }
    
    static func makeQuestion(id: Int) -> Question {
        Question(
            id: id,
            viewCount: 2770,
            answerCount: 3,
            title: shortText,
            body: longText,
            isAnswered: true,
            creationDate: Date(),
            tags: tags,
            owner: user,
            comments: [makeComment(id: 1), makeComment(id: 2), makeComment(id: 3)],
            answers: [makeAnswer(id: 1, isAccepted: true), makeAnswer(id: 2), makeAnswer(id: 3)],
            score: 359
        )
    }
}
