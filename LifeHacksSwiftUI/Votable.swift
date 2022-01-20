//
//  Votable.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 20/01/2022.
//

import Foundation

// MARK: - Vote
enum Vote: Int {
    case none = 0
    case up = 1
    case down = -1
}

// MARK: - Votable
protocol Votable {
    var vote: Vote { get set }
    var score: Int { get set }
}

extension Votable {
    mutating func upvote() {
        cast(vote: .up)
    }

    mutating func downvote() {
        cast(vote: .down)
    }
    
    mutating func unvote() {
        score -= vote.rawValue
        vote = .none
    }
}

// MARK: Private
private extension Votable {
    mutating func cast(vote: Vote) {
        guard self.vote != vote else { return }
        unvote()
        score += vote.rawValue
        self.vote = vote
    }
}
