//
//  Person.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation



struct Person: Identifiable {
    let id: UUID = UUID()
    var name: String
    var email: String
    var profilePicture: String?
    var age: Int?
    var description: String?
    var pronouns: EPronoun
    var privateConversations: [PrivateConversation]
}
