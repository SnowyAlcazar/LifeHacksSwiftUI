//
//  ApiController.swift
//  LifeHacksSwiftUI
//
//  Created by Mark Brown on 22/01/2022.
//

import Foundation

// This class is provided as an example of a common approach but is not used as the final solution in the app

class ApiController: ObservableObject {
    struct StackExchangeAPI {
        static let questionsURL = URL(string: "https://api.stackexchange.com/2.3/questions")!
        static let usersURL = URL(string: "https://api.stackexchange.com/2.3/users")!
    }
    
    func loadQuestions() async -> [Question]? {
        let parameters = ["order": "desc", "sort": "activity", "site": "lifehacks", "pagesize": "10"]
        let url = StackExchangeAPI.questionsURL.appendingParameters(parameters)
        guard let (data, _) = try? await URLSession.shared.data(from: url) else { return nil }
        let wrapper = try? JSONDecoder().decode(Wrapper<Question>.self, from: data)
        return wrapper?.items
    }
    
    func loadQuestion(with id: Int) async -> Question? {
        let parameters = ["filter": "withBody", "site": "lifehacks"]
        let url = StackExchangeAPI.questionsURL.appendingPathComponent("\(id)")
            .appendingParameters(parameters)
        guard let (data, _) = try? await URLSession.shared.data(from: url) else { return nil }
        let wrapper = try? JSONDecoder().decode(Wrapper<Question>.self, from: data)
        return wrapper?.items[0]
    }
    
    func loadUser(with id: Int) async -> User? {
        let parameters = ["filter": "!9YdnSA078", "site": "lifehacks"]
        let url = StackExchangeAPI.questionsURL.appendingPathComponent("\(id)")
            .appendingParameters(parameters)
        guard let (data, _) = try? await URLSession.shared.data(from: url) else { return nil }
        let wrapper = try? JSONDecoder().decode(Wrapper<User>.self, from: data)
        return wrapper?.items[0]
    }
}

private extension ApiController {
    enum Resource {
        case questions
        case question(id: Int)
        case user(id: Int)
    }
    
    func load(resource: Resource) async -> Any? {
        let url: URL
        switch resource {
            case .questions:
                let parameters = ["order": "desc", "sort": "activity", "pagesize": "10"]
                url = StackExchangeAPI.questionsURL.appendingParameters(parameters)
            case .question(let id):
                let parameters = ["filter": "withBody"]
                url = StackExchangeAPI.questionsURL.appendingPathComponent("\(id)")
                    .appendingParameters(parameters)
            case .user(let id):
                let parameters = ["filter": "!9YdnSA078"]
                url = StackExchangeAPI.questionsURL.appendingPathComponent("\(id)")
                    .appendingParameters(parameters)
        }
        guard let (data, _) = try? await URLSession.shared
                .data(from: url.appendingParameters(["site": "lifehacks"])) else { return nil }
        switch resource {
            case .questions:
                let wrapper = try? JSONDecoder().decode(Wrapper<Question>.self, from: data)
                return wrapper?.items
            case .question:
                let wrapper = try? JSONDecoder().decode(Wrapper<Question>.self, from: data)
                return wrapper?.items[0]
            case .user:
                let wrapper = try? JSONDecoder().decode(Wrapper<User>.self, from: data)
                return wrapper?.items[0]
        }
    }
}
