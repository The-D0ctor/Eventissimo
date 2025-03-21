//
//  privateConversation.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation

struct PrivateConversation: Identifiable, Codable, Equatable {
    var id: String = UUID().uuidString
    
    var messages: [MessageApp] = []
    var messagesRefs: [String] = []
    var person1: Person = Person(name: "", email: "", pronouns: .heHim)
    var person1Ref: String?
    var person2: Person = Person(name: "", email: "", pronouns: .heHim)
    var person2Ref: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case messagesRefs = "messages"
        case person1Ref
        case person2Ref
    }
}
