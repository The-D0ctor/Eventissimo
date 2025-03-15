//
//  Person.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation



struct Person: Identifiable, Equatable {
    let id: UUID = UUID()
    var name: String
    var email: String
    var profilePicture: String?
    var age: Int?
    var description: String?
    var pronouns: EPronoun
    var eventOrganized: Int? // 👉 ajout de var Evenènements organisés
    var eventParticipated: Int? // 👉 ajout de var Evenènements participations
}
