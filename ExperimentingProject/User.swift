//
//  User.swift
//  ExperimentingProject
//
//  Created by Maertens Yann-Christophe on 30/03/22.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var username: String
    var image: String
    var country: String
    var content: [UserContent]
}

struct UserContent: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var comments: [UserComment]
}

struct UserComment: Identifiable {
    var id = UUID()
    var user: User
    var message: String
}

extension User {
    static let maria = User(username: "Maria", image: "mariaImage", country: "🇺🇸 United States", content: UserContent.messages)
    static let paul = User(username: "Paul", image: "paulImage", country: "🇺🇸 United States", content: [])
    static let kevin = User(username: "Kevin", image: "kevinImage", country: "🇺🇸 United States", content: [])
    static let lisa = User(username: "Lise", image: "lisaImage", country: "🇺🇸 United States", content: [])
}

extension UserContent {
    static let messages = [
        UserContent(
            title: "Some pretty sunflowers!",
            image: "photo00",
            comments: [UserComment(user: User.paul, message: "This beautiful")]
        ),
        UserContent(
            title: "I'm working this image!",
            image: "photo01",
            comments: [UserComment(user: User.kevin, message: "Great work")]
        ),
        UserContent(
            title: "The weather is not good today...",
            image: "photo02",
            comments: [UserComment(user: User.lisa, message: "Take care")]
        ),
    ]
}
