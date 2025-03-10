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
    var eventOrganized: Int? // 👉 ajout de var Evenènements organisés
    var eventParticipated: Int? // 👉 ajout de var Evenènements participations
}

var newPerson : [Person] = [
    Person(name: "Marion",
           email: "marion.fake@icloud.com",
           pronouns: .sheHer,
           privateConversations: newPrivateConversation),
    Person(name: "Marie",
           email: "marie.fake@icloud.com",
           pronouns: .sheHer,
           privateConversations: newPrivateConversation)
]

// 👇 ajout du profil de Marion
var users: [Person] = [
    Person(name: "Marion Lanvin",
           email: "marion.lanvin@example.com",
           profilePicture: "marionProfilePicture",
           age: 30,
           description: "J'adore les blind tests et danser 🕺 !",
           pronouns: .sheHer,
           privateConversations: [],
           eventOrganized: 2,
           eventParticipated: 13),
    
    Person(name: "Alexandre Dupont",
           email: "alex.dupont@example.com",
           profilePicture: "alexProfilePicture",
           age: 28,
           description: "Passionné de randonnée et de photographie 📸.",
           pronouns: .heHim,
           privateConversations: [],
           eventOrganized: 5,
           eventParticipated: 8),
    
    Person(name: "Sophie Martin",
           email: "sophie.martin@example.com",
           profilePicture: "sophieProfilePicture",
           age: 34,
           description: "Fan de cuisine et de voyages 🌍🍜.",
           pronouns: .sheHer,
           privateConversations: [],
           eventOrganized: 3,
           eventParticipated: 15),
    
    Person(name: "Jules Bernard",
           email: "jules.bernard@example.com",
           profilePicture: "julesProfilePicture",
           age: 22,
           description: "Gamer invétéré et amateur de café ☕🎮.",
           pronouns: .heHim,
           privateConversations: [],
           eventOrganized: 1,
           eventParticipated: 9),
    
    Person(name: "Camille Lefevre",
           email: "camille.lefevre@example.com",
           profilePicture: "camilleProfilePicture",
           age: 26,
           description: "Amatrice de danse et de yoga 🧘‍♀️💃.",
           pronouns: .sheHer,
           privateConversations: [],
           eventOrganized: 4,
           eventParticipated: 12),
    
    Person(name: "Nicolas Moreau",
           email: "nicolas.moreau@example.com",
           profilePicture: "nicolasProfilePicture",
           age: 40,
           description: "Musicien et grand fan de jazz 🎷🎶",
           pronouns: .heHim,
           privateConversations: [],
           eventOrganized: 6,
           eventParticipated: 20),
    
    Person(name: "Élise Perrin",
           email: "elise.perrin@example.com",
           profilePicture: "eliseProfilePicture",
           age: 31,
           description: "Adore les escape games et les thrillers 🔍🎭",
           pronouns: .sheHer,
           privateConversations: [],
           eventOrganized: 2,
           eventParticipated: 14),
    
    Person(name: "Lucas Girard",
           email: "lucas.girard@example.com",
           profilePicture: "lucasProfilePicture",
           age: 21,
           description: "Toujours partant pour un foot entre amis ⚽",
           pronouns: .heHim,
           privateConversations: [],
           eventOrganized: 0,
           eventParticipated: 7),
    
    Person(name: "Lola Dubois",
           email: "lola.dubois@example.com",
           profilePicture: "lolaProfilePicture",
           age: 29,
           description: "Grande lectrice et adepte de jeux de société 📚🎲",
           pronouns: .sheHer,
           privateConversations: [],
           eventOrganized: 3,
           eventParticipated: 10),
    
    Person(name: "Thomas Leroy",
           email: "thomas.leroy@example.com",
           profilePicture: "thomasProfilePicture",
           age: 35,
           description: "Cycliste et amateur de bonne cuisine 🚴‍♂️🍽️",
           pronouns: .heHim,
           privateConversations: [],
           eventOrganized: 5,
           eventParticipated: 11),
    
    Person(name: "Emma Rousseau",
           email: "emma.rousseau@example.com",
           profilePicture: "emmaProfilePicture",
           age: 24,
           description: "Cinéphile et fan de Marvel 🎬🦸‍♀️",
           pronouns: .sheHer,
           privateConversations: [],
           eventOrganized: 1,
           eventParticipated: 8)
]
