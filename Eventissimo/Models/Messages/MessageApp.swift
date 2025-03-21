//
//  Message.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation
import FirebaseFirestore

struct MessageApp: Identifiable, Codable, Equatable {
    var id: String = UUID().uuidString
    var text: String
    var date: Date
    var person: Person = Person(name: "", email: "", pronouns: .heHim)
    var personRef: String?
    
    enum CodingKeys:  CodingKey {
        case id
        case text
        case date
        //case person
        case personRef
    }
}
