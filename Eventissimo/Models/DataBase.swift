//
//  DataBase.swift
//  Eventissimo
//
//  Created by apprenant103 on 10/03/2025.
//

import Foundation
import Observation
import SwiftUI

// MARK: - PERSON

@Observable class DataBase {
    var currentUser: Person = marion
    
    var events: [EventApp] = [
        EventApp(
            name: "Anniversaire de Marion",
            description: "Fêtez mes 30 ans avec moi ! Je vous attends à 19h chez moi 🎂🎉 Venez avec votre bonne humeur et prêts à danser toute la soirée !",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 05, day: 10, hour: 19, minute: 0)) ?? Date(),
            localization: "Lyon - 18 rue du lac",
            participants: [
                Participant(person: users[0], role: .organizer),
                Participant(person: users[1], role: .guest),
                Participant(person: users[3], role: .guest),
                Participant(person: users[4], role: .guest),
                Participant(person: users[6], role: .guest)
            ],
            nonParticipants: [
                Participant(person: users[2], role: nil),
                Participant(person: users[8], role: nil),
                Participant(person: users[9], role: nil)
            ],
            image: Image("birthdayMarionEvent"),
            tasks: [tasks[0], tasks[1]],
            budget: Budget(totalBudget: 200, spendings: sprendingsAnnivMarion),
            eventMessages: newMessageApp
        ),
        
        EventApp(
            name: "Tournoi de Football Interclubs",
            description: "Un tournoi amical U14 organisé entre les différentes équipes locales de la métropole lyonnaise, pour promouvoir le sport et la convivialité.",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 05, day: 21, hour: 9, minute: 30)) ?? Date(),
            localization: "Lyon  - Stade Municipal",
            participants: [
                Participant(person: lucas, role: .organizer),
                Participant(person: thomas, role: .organizer),
                Participant(person: alexandre, role: .organizer),
                Participant(person: jules, role: .organizer),
                Participant(person: emma, role: .guest),
                Participant(person: camille, role: .guest),
                Participant(person: nicolas, role: .guest),
                Participant(person: alexandre, role: .guest),
                Participant(person: elise, role: .guest),
                Participant(person: marion, role: .guest),
            ],
            nonParticipants: [
                Participant(person: lola)
            ],
            image: Image("soccerEvent"),
            tasks: [tasks[18], tasks[19], tasks[20], tasks[21], tasks[22]],
            budget: Budget(totalBudget: 2000, spendings: spendingsTournoiFoot),
            eventMessages: []
        ),
        
        EventApp(
            name: "Anniversaire de Lola",
            description: "Je vous invite à mon anniversaire ce week-end ! 🎉 Sur le thème films Disney, venez déguisés 😳 et préparez-vous pour un blind test musical et des jeux toute la soirée !",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 06, day: 12, hour: 19, minute: 0)) ?? Date(),
            localization: "Lyon - 250 rue Inkermann",
            participants: [
                Participant(person: users[0], role: .guest),
                Participant(person: users[8], role: .organizer),
                Participant(person: users[2], role: .guest),
                Participant(person: users[4], role: .guest),
                Participant(person: users[5], role: .guest),
                Participant(person: users[7], role: .guest)
            ],
            nonParticipants: [
                Participant(person: users[1], role: nil),
                Participant(person: users[3], role: nil),
                Participant(person: users[9], role: nil)
            ],
            image: Image("birthdayLolaEvent"),
            tasks: [tasks[2], tasks[3], tasks[4]],
            budget: Budget(totalBudget: 400, spendings: sprendingsAnnivMarion),
            eventMessages: []
        ),
        
        
        EventApp(
            name: "Vide grenier",
            description: "Venez chiner et trouver des trésors cachés ! 🛍️ De nombreux stands et animations sur place. Pensez à apporter votre monnaie et de quoi transporter vos trouvailles !",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 06, day: 29, hour: 8, minute: 30)) ?? Date(),
            localization: "Vauban - rue Principale",
            participants: [
                Participant(person: users[0], role: .guest),
                Participant(person: users[3], role: .guest),
                Participant(person: users[4], role: .guest),
                Participant(person: users[6], role: .organizer)
            ],
            nonParticipants: [
                Participant(person: users[1], role: nil),
                Participant(person: users[2], role: nil),
                Participant(person: users[8], role: nil)
            ],
            image: Image("brocanteEvent"),
            tasks: [tasks[7], tasks[8], tasks[9]],
            budget: Budget(totalBudget: 1000, spendings: []),
            eventMessages: []
        ),
        
        EventApp(
            name: "Fête de la Saint-Jean",
            description: "Célébrons la Saint-Jean autour d’un grand feu de joie, avec musique live et barbecue ! 🔥 Apportez vos grillades et vos instruments de musique 🎶",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 08, day: 24, hour: 18, minute: 0)) ?? Date(),
            localization: "Sancé - salle des fêtes",
            participants: [
                Participant(person: users[0], role: .guest),
                Participant(person: users[1], role: .guest),
                Participant(person: users[5], role: .guest),
                Participant(person: users[7], role: .organizer)
            ],
            nonParticipants: [
                Participant(person: users[2], role: nil),
                Participant(person: users[3], role: nil),
                Participant(person: users[6], role: nil)
            ],
            image: Image("village1Event"),
            tasks: [tasks[10], tasks[11], tasks[12]],
            budget: Budget(totalBudget: 50, spendings: []),
            eventMessages: []
        ),
        
        EventApp(
            name: "Nouvel an",
            description: "Célébrons ensemble le passage à la nouvelle année ! 🎆 Buffet, musique et feu d’artifice à minuit. Venez avec une bonne résolution à partager !",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 31, hour: 20, minute: 0)) ?? Date(),
            localization: "Tarare - 22 rue des peupliers",
            participants: [
                Participant(person: users[0], role: .organizer),
                Participant(person: users[2], role: .guest),
                Participant(person: users[5], role: .guest),
                Participant(person: users[6], role: .guest),
                Participant(person: users[7], role: .guest)
            ],
            nonParticipants: [
                Participant(person: users[1], role: nil),
                Participant(person: users[3], role: nil),
                Participant(person: users[9], role: nil)
            ],
            image: Image("newYearEvent"),
            tasks: [tasks[5], tasks[6]],
            budget: Budget(totalBudget: 60, spendings: []),
            eventMessages: []
        ),
        
        EventApp(
            name: "Mariage de Sophie & Thomas",
            description: "Célébration du mariage de Sophie et Thomas avec famille et amis. La journée sera remplie d'amour, de joie et de festivités, incluant une cérémonie émouvante et une réception mémorable.",
            date: Calendar.current.date(from: DateComponents(year: 2026, month: 07, day: 10, hour: 11, minute: 0)) ?? Date(),
            localization: "Chantilly - Château",
            participants: [
                Participant(person: sophie, role: .organizer),
                Participant(person: thomas, role: .organizer),
                Participant(person: marion, role: .organizer),
                Participant(person: emma, role: .volunteer),
                Participant(person: lola, role: .guest),
                Participant(person: lucas, role: .guest),
                Participant(person: jules, role: .guest)
            ],
            nonParticipants: [
                Participant(person: camille),
                Participant(person: nicolas),
                Participant(person: alexandre),
                Participant(person: elise)
            ],
            image: Image("weddingThomasSophieEvent"),
            tasks: [tasks[13], tasks[14], tasks[15], tasks[16], tasks[17]],
            budget: Budget(totalBudget: 12000, spendings: spendingsMarriage),
            eventMessages: []
        )
        
        
        
        
    ]

    var privateConversations : [PrivateConversation] = [
        /*PrivateConversation(messages: newMessageApp,
                            person1:alexandre, person2: marion),
        PrivateConversation(messages: [],
                            person1:alexandre, person2: sophie),
        PrivateConversation(messages: [],
                            person1:marion, person2: sophie),
        PrivateConversation(messages: [],
                            person1:jules, person2: marion),
        PrivateConversation(messages: [],
                            person1:marion, person2: camille),
        PrivateConversation(messages: [],
                            person1:nicolas, person2: marion)*/
    ]
    
    // on filtre tous les évents où l'utilisateur connecté est particpant via son ID ( computed proprety)
    
    var myEvents: [EventApp] {
        get {
            events.filter { event in
                event.participants.contains { $0.person.id == currentUser.id }
            }
        }
        set(newEvents) {
            for newEvent in newEvents {
                if let eventIndex = events.firstIndex(where: { event in
                    event.id == newEvent.id
                }) {
                    events[eventIndex] = newEvent
                }
            }
        }
    }
    
    var currentUserPrivateConversations: [PrivateConversation] {
        get {
            return privateConversations.filter({ privateConversation in
                privateConversation.person1.id == currentUser.id || privateConversation.person2.id == currentUser.id
            })
        }
        
        set(newPrivateConversations) {
            for newPrivateConversation in newPrivateConversations {
                if let index = privateConversations.firstIndex(where: { privateConversation in
                    (privateConversation.person1.id == newPrivateConversation.person1.id && privateConversation.person2.id == newPrivateConversation.person2.id) || (privateConversation.person1.id == newPrivateConversation.person2.id && privateConversation.person2.id == newPrivateConversation.person1.id)
                }) {
                    privateConversations[index] = newPrivateConversation
                }
            }
        }
    }
    
    var persons: [Person] = []
}

var marion: Person = Person(
    id: "rZJL2c23HxdXELbnQzoL",
    name: "Marion Lanvin",
    email: "marion.lanvin@example.com",
    profilePictureName: "marionProfilePicture",
    age: 30,
    description: "J'adore les blind tests et danser 🕺 !",
    pronouns: .sheHer,
    eventOrganized: 2,
    eventParticipated: 13)

var alexandre: Person = Person(
    id: "7dYc1Sy7mAuwyDan0GHB",
    name: "Alexandre Dupont",
    email: "alex.dupont@example.com",
    profilePictureName: "alexProfilePicture",
    age: 28,
    description: "Passionné de randonnée et de photographie 📸.",
    pronouns: .heHim,
    eventOrganized: 5,
    eventParticipated: 8)

var sophie: Person = Person(
    id: "3u9Lc1RiROPFY6LzPrG9",
    name: "Sophie Martin",
    email: "sophie.martin@example.com",
    profilePictureName: "sophieProfilePicture",
    age: 34,
    description: "Fan de cuisine et de voyages 🌍🍜.",
    pronouns: .sheHer,
    eventOrganized: 3,
    eventParticipated: 15)

var jules: Person = Person(
    id: "RcdPxBBeD2Q2lTCDu821",
    name: "Jules Bernard",
    email: "jules.bernard@example.com",
    profilePictureName: "julesProfilePicture",
    age: 22,
    description: "Gamer invétéré et amateur de café ☕🎮.",
    pronouns: .heHim,
    eventOrganized: 1,
    eventParticipated: 9)

var camille: Person = Person(
    id: "TMhTxiVcqzJp6fSalPBe",
    name: "Camille Lefevre",
    email: "camille.lefevre@example.com",
    profilePictureName: "camilleProfilePicture",
    age: 26,
    description: "Amatrice de danse et de yoga 🧘‍♀️💃.",
    pronouns: .sheHer,
    eventOrganized: 4,
    eventParticipated: 12)

var nicolas : Person = Person(
    id: "g0GJ3Nf1iUcLPik8LlT7",
    name: "Nicolas Moreau",
    email: "nicolas.moreau@example.com",
    profilePictureName: "nicolasProfilePicture",
    age: 40,
    description: "Musicien et grand fan de jazz 🎷🎶",
    pronouns: .heHim,
    eventOrganized: 6,
    eventParticipated: 20)

var elise: Person = Person(
    id: "s6COzV5GMiVTyNJ0nDKt",
    name: "Élise Perrin",
    email: "elise.perrin@example.com",
    profilePictureName: "eliseProfilePicture",
    age: 31,
    description: "Adore les escape games et les thrillers 🔍🎭",
    pronouns: .sheHer,
    eventOrganized: 2,
    eventParticipated: 14)

var lucas: Person = Person(
    id: "wIXQaaW7dWZM9mjwRsnP",
    name: "Lucas Girard",
    email: "lucas.girard@example.com",
    profilePictureName: "lucasProfilePicture",
    age: 21,
    description: "Toujours partant pour un foot entre amis ⚽",
    pronouns: .heHim,
    eventOrganized: 0,
    eventParticipated: 7)

var lola: Person = Person(
    id: "zwDlkhhVUOcR2usCSrFu",
    name: "Lola Dubois",
    email: "lola.dubois@example.com",
    profilePictureName: "lolaProfilePicture",
    age: 29,
    description: "Grande lectrice et adepte de jeux de société 📚🎲",
    pronouns: .sheHer,
    eventOrganized: 3,
    eventParticipated: 10)

var thomas: Person = Person(
    id: "VrFigD16zEp2UESlS4El",
    name: "Thomas Leroy",
    email: "thomas.leroy@example.com",
    profilePictureName: "thomasProfilePicture",
    age: 35,
    description: "Cycliste et amateur de bonne cuisine 🚴‍♂️🍽️",
    pronouns: .heHim,
    eventOrganized: 5,
    eventParticipated: 11)

var emma: Person = Person(
    id: "TGo3MN44I0fXjsFwq5Np",
    name: "Emma Rousseau",
    email: "emma.rousseau@example.com",
    profilePictureName: "emmaProfilePicture",
    age: 24,
    description: "Cinéphile et fan de Marvel 🎬🦸‍♀️",
    pronouns: .sheHer,
    
    eventOrganized: 1,
    eventParticipated: 8)

// 👇 liste des personnes
var users: [Person] = [
    marion, alexandre, sophie, jules, lucas, camille, nicolas, elise, lola, thomas, emma
]

// 🙋‍♀️ création d'une variable "fake" tous les users = tous les invités en tableau de participants
var allInvited = [
    Participant(person: marion, role: nil),
    Participant(person: alexandre, role: nil),
    Participant(person: sophie, role: nil),
    Participant(person: jules, role: nil),
    Participant(person: camille, role: nil),
    Participant(person: nicolas, role: nil),
    Participant(person: elise, role: nil),
    Participant(person: thomas, role: nil),
    Participant(person: emma, role: nil),
    Participant(person: lola, role: nil)
]

// MARK: - PARTICIPANTS

var participantsMarionBirthday: [Participant] = [
    Participant(person: marion, role: .organizer),
    Participant(person: alexandre, role: .volunteer),
    Participant(person: emma, role: .guest),
    Participant(person: jules, role: .volunteer)
]

var participantsVideGrenier: [Participant] = [
    Participant(person: marion, role: .guest),
    Participant(person: thomas, role: .organizer),
    Participant(person: lola, role: .volunteer)
]

var participantsFeteSaintJean: [Participant] = [
    Participant(person: marion, role: .organizer),
    Participant(person: alexandre, role: .volunteer),
    Participant(person: emma, role: .guest),
    Participant(person: jules, role: .volunteer)
]


// MARK: - EVENTS

var events: [EventApp] = [
    EventApp(
        name: "Anniversaire de Marion",
        description: "Fêtez mes 30 ans avec moi ! Je vous attends à 19h chez moi 🎂🎉 Venez avec votre bonne humeur et prêts à danser toute la soirée !",
        date: Calendar.current.date(from: DateComponents(year: 2025, month: 05, day: 10, hour: 19, minute: 0)) ?? Date(),
        localization: "Lyon - 18 rue du lac",
        participants: [
            Participant(person: users[0], role: .organizer),
            Participant(person: users[1], role: .guest),
            Participant(person: users[3], role: .guest),
            Participant(person: users[4], role: .guest),
            Participant(person: users[6], role: .guest)
        ],
        nonParticipants: [
            Participant(person: users[2], role: nil),
            Participant(person: users[8], role: nil),
            Participant(person: users[9], role: nil)
        ],
        image: Image("birthdayMarionEvent"),
        tasks: [tasks[0], tasks[1]],
        budget: Budget(totalBudget: 200, spendings: sprendingsAnnivMarion),
        eventMessages: newMessageApp
    ),
    
    EventApp(
        name: "Tournoi de Football Interclubs",
        description: "Un tournoi amical U14 organisé entre les différentes équipes locales de la métropole lyonnaise, pour promouvoir le sport et la convivialité.",
        date: Calendar.current.date(from: DateComponents(year: 2025, month: 05, day: 21, hour: 9, minute: 30)) ?? Date(),
        localization: "Lyon  - Stade Municipal",
        participants: [
            Participant(person: lucas, role: .organizer),
            Participant(person: thomas, role: .organizer),
            Participant(person: alexandre, role: .organizer),
            Participant(person: jules, role: .organizer),
            Participant(person: emma, role: .guest),
            Participant(person: camille, role: .guest),
            Participant(person: nicolas, role: .guest),
            Participant(person: alexandre, role: .guest),
            Participant(person: elise, role: .guest),
            Participant(person: marion, role: .guest),
        ],
        nonParticipants: [
            Participant(person: lola)
        ],
        image: Image("soccerEvent"),
        tasks: [tasks[18], tasks[19], tasks[20], tasks[21], tasks[22]],
        budget: Budget(totalBudget: 2000, spendings: spendingsTournoiFoot),
        eventMessages: []
    ),
    
    EventApp(
        name: "Anniversaire de Lola",
        description: "Je vous invite à mon anniversaire ce week-end ! 🎉 Sur le thème films Disney, venez déguisés 😳 et préparez-vous pour un blind test musical et des jeux toute la soirée !",
        date: Calendar.current.date(from: DateComponents(year: 2025, month: 06, day: 12, hour: 19, minute: 0)) ?? Date(),
        localization: "Lyon - 250 rue Inkermann",
        participants: [
            Participant(person: users[0], role: .guest),
            Participant(person: users[8], role: .organizer),
            Participant(person: users[2], role: .guest),
            Participant(person: users[4], role: .guest),
            Participant(person: users[5], role: .guest),
            Participant(person: users[7], role: .guest)
        ],
        nonParticipants: [
            Participant(person: users[1], role: nil),
            Participant(person: users[3], role: nil),
            Participant(person: users[9], role: nil)
        ],
        image: Image("birthdayLolaEvent"),
        tasks: [tasks[2], tasks[3], tasks[4]],
        budget: Budget(totalBudget: 400, spendings: sprendingsAnnivMarion),
        eventMessages: []
    ),
    
    
    EventApp(
        name: "Vide grenier",
        description: "Venez chiner et trouver des trésors cachés ! 🛍️ De nombreux stands et animations sur place. Pensez à apporter votre monnaie et de quoi transporter vos trouvailles !",
        date: Calendar.current.date(from: DateComponents(year: 2025, month: 06, day: 29, hour: 8, minute: 30)) ?? Date(),
        localization: "Vauban - rue Principale",
        participants: [
            Participant(person: users[0], role: .guest),
            Participant(person: users[3], role: .guest),
            Participant(person: users[4], role: .guest),
            Participant(person: users[6], role: .organizer)
        ],
        nonParticipants: [
            Participant(person: users[1], role: nil),
            Participant(person: users[2], role: nil),
            Participant(person: users[8], role: nil)
        ],
        image: Image("brocanteEvent"),
        tasks: [tasks[7], tasks[8], tasks[9]],
        budget: Budget(totalBudget: 1000, spendings: []),
        eventMessages: []
    ),
    
    EventApp(
        name: "Fête de la Saint-Jean",
        description: "Célébrons la Saint-Jean autour d’un grand feu de joie, avec musique live et barbecue ! 🔥 Apportez vos grillades et vos instruments de musique 🎶",
        date: Calendar.current.date(from: DateComponents(year: 2025, month: 08, day: 24, hour: 18, minute: 0)) ?? Date(),
        localization: "Sancé - salle des fêtes",
        participants: [
            Participant(person: users[0], role: .guest),
            Participant(person: users[1], role: .guest),
            Participant(person: users[5], role: .guest),
            Participant(person: users[7], role: .organizer)
        ],
        nonParticipants: [
            Participant(person: users[2], role: nil),
            Participant(person: users[3], role: nil),
            Participant(person: users[6], role: nil)
        ],
        image: Image("village1Event"),
        tasks: [tasks[10], tasks[11], tasks[12]],
        budget: Budget(totalBudget: 50, spendings: []),
        eventMessages: []
    ),
    
    EventApp(
        name: "Nouvel an",
        description: "Célébrons ensemble le passage à la nouvelle année ! 🎆 Buffet, musique et feu d’artifice à minuit. Venez avec une bonne résolution à partager !",
        date: Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 31, hour: 20, minute: 0)) ?? Date(),
        localization: "Tarare - 22 rue des peupliers",
        participants: [
            Participant(person: users[0], role: .organizer),
            Participant(person: users[2], role: .guest),
            Participant(person: users[5], role: .guest),
            Participant(person: users[6], role: .guest),
            Participant(person: users[7], role: .guest)
        ],
        nonParticipants: [
            Participant(person: users[1], role: nil),
            Participant(person: users[3], role: nil),
            Participant(person: users[9], role: nil)
        ],
        image: Image("newYearEvent"),
        tasks: [tasks[5], tasks[6]],
        budget: Budget(totalBudget: 60, spendings: []),
        eventMessages: []
    ),
    
    EventApp(
        name: "Mariage de Sophie & Thomas",
        description: "Célébration du mariage de Sophie et Thomas avec famille et amis. La journée sera remplie d'amour, de joie et de festivités, incluant une cérémonie émouvante et une réception mémorable.",
        date: Calendar.current.date(from: DateComponents(year: 2026, month: 07, day: 10, hour: 11, minute: 0)) ?? Date(),
        localization: "Chantilly - Château",
        participants: [
            Participant(person: sophie, role: .organizer),
            Participant(person: thomas, role: .organizer),
            Participant(person: marion, role: .organizer),
            Participant(person: emma, role: .volunteer),
            Participant(person: lola, role: .guest),
            Participant(person: lucas, role: .organizer),
            Participant(person: jules, role: .guest)
        ],
        nonParticipants: [
            Participant(person: camille),
            Participant(person: nicolas),
            Participant(person: alexandre),
            Participant(person: elise)
        ],
        image: Image("weddingThomasSophieEvent"),
        tasks: [tasks[13], tasks[14], tasks[15], tasks[16], tasks[17]],
        budget: Budget(totalBudget: 12000, spendings: spendingsMarriage),
        eventMessages: []
    )
    
    
    
    
]


// MARK: - MESSAGES

var newMessageApp: [MessageApp] = [
    MessageApp(text: "Ready to party??",
               date: .now,
               person: marion),
    MessageApp(text: "So ready! You better be prepared!",
               date: .now,
               person: jules),
    MessageApp(text: "I'm so happy !", date: .now, person: alexandre)
]

// MARK: - PRIVATE CONVERSATION

var newPrivateConversation : [PrivateConversation] = [
    PrivateConversation(messages: newMessageApp,
                        person1:alexandre, person2: marion),
    PrivateConversation(messages: [],
                        person1:alexandre, person2: sophie),
    PrivateConversation(messages: [],
                        person1:marion, person2: sophie),
    PrivateConversation(messages: [],
                        person1:jules, person2: marion),
    PrivateConversation(messages: [],
                        person1:marion, person2: camille),
    PrivateConversation(messages: [],
                        person1:nicolas, person2: marion)
]


// MARK: - SPENDING

var sprendingsAnnivMarion : [Spending] = [
    Spending(amount: 5.20,
             role: .food,
             descriptionSpend: "Coca et Fanta",
             person: marion),
    Spending(amount: 20,
             role: .food,
             descriptionSpend: "Raclette et charcuterie",
             person: alexandre),
    Spending(amount: 15,
             role: .decorations,
             descriptionSpend: "Ballons et nappe",
             person: alexandre),
    Spending(amount: 15,
             role: .entertainment,
             descriptionSpend: "enceinte pour karaoké",
             person: emma)
]

var sprendingsNouvelAn : [Spending] = [
    Spending(amount: 5.2,
             role: .decorations,
             descriptionSpend: "Coca et Fanta",
             person: users[0])
]

var sprendingsFeteSaintJean : [Spending] = [
    Spending(amount: 5.2,
             role: .decorations,
             descriptionSpend: "Coca et Fanta",
             person: users[0])
]

var spendingsMarriage: [Spending] = [
    Spending(
        amount: 5000.0,
        role: .food,
        descriptionSpend: "Service traiteur pour 100 invités, incluant le repas et les boissons.",
        person: sophie
    ),

    Spending(
        amount: 2400.0,
        role: .transportation,
        descriptionSpend: "Réservation d'un hôtel pour la famille proche et transport des invités.",
        person: thomas
    ),

    Spending(
        amount: 1500.0,
        role: .entertainment,
        descriptionSpend: "DJ et groupe de musique pour la soirée dansante.",
        person: thomas
    ),

    Spending(
        amount: 1140.0,
        role: .decorations,
        descriptionSpend: "Fleurs, centre de table et décoration de la salle de réception.",
        person: sophie
    ),

    Spending(
        amount: 830.0,
        role: .rentals,
        descriptionSpend: "Location de matériel : chaises, tables et vaisselle.",
        person: sophie
    ),

    Spending(
        amount: 500.0,
        role: .other,
        descriptionSpend: "Cadeaux souvenirs pour les invités.",
        person: thomas
    ),
    Spending(
        amount: 345.0,
        role: .food,
        descriptionSpend: "Gâteaux et desserts de mariage.",
        person: sophie
    )
]

var spendingsTournoiFoot: [Spending] = [
    Spending(
        amount: 200.0,
        role: .rentals,
        descriptionSpend: "Location du stade et des vestiaires pour la journée du tournoi.",
        person: lucas
    ),

    Spending(
        amount: 700.0,
        role: .entertainment,
        descriptionSpend: "Sonorisation, speaker et animations pendant les pauses.",
        person: alexandre
    ),

    Spending(
        amount: 80.0,
        role: .transportation,
        descriptionSpend: "Transport des équipes venant de l'extérieur avec un minibus.",
        person: alexandre
    ),

    Spending(
        amount: 55.0,
        role: .decorations,
        descriptionSpend: "Banderoles, podium pour les gagnants et ballons aux couleurs du tournoi.",
        person: thomas
    ),

    Spending(
        amount: 100.0,
        role: .other,
        descriptionSpend: "Médailles, trophées et goodies pour les participants.",
        person: jules
    ),
    Spending(
        amount: 220.0,
        role: .food,
        descriptionSpend: "Achat de snacks, sandwiches et boissons pour la buvette.",
        person: alexandre
    ),

    Spending(
        amount: 150.0,
        role: .food,
        descriptionSpend: "Préparation de repas pour les bénévoles et les arbitres.",
        person: jules
    ),

    Spending(
        amount: 300.0,
        role: .rentals,
        descriptionSpend: "Location de chaises, tables et tentes pour l'accueil des équipes et spectateurs.",
        person: lucas
    ),

    Spending(
        amount: 180.0,
        role: .rentals,
        descriptionSpend: "Location d’un générateur électrique pour l'éclairage et la sonorisation.",
        person: lucas
    ),
]

// MARK: - BUDGET

var budgetAnnivMarion: Budget = Budget(totalBudget: 1000, spendings: sprendingsAnnivMarion)
var budgetFeteSaintJean: Budget = Budget(totalBudget: 700, spendings: sprendingsFeteSaintJean)



// MARK: - TASKS

let tasks: [TaskApp] = [
    TaskApp(title: "Aller chercher le gâteau",
            description: "rendez-vous prévu à 13H15",
            isUrgent: true,
            personsAssigned: [users[1],users[9]]),
    
    TaskApp(title: "Gonfler les ballons",
            isCompleted: true,
            personsAssigned: [users[0],users[2],users[7]]),
    
    TaskApp(title: "Préparer la liste des invités",
            description: "Se concerter avec Emma",
            isUrgent: true,
            personsAssigned: [users[0],users[10]]),
    
    TaskApp(title: "Réserver un lieu",
            isCompleted: true,
            personsAssigned: [users[6]]),
    
    TaskApp(title: "Acheter un cadeau",
            description: "Chercher chez Sephora",
            isUrgent: true,
            personsAssigned: [users[5],users[1]]),
    
    TaskApp(title: "Organiser le repas",
            description: "Mettre en place un budget",
            personsAssigned: [users[3],users[9]]),
    
    TaskApp(title: "Prévoir les décorations",
            isUrgent: true,
            personsAssigned: [users[0],users[2],users[7],users[5],users[1]]),
    
    TaskApp(title: "Préparer les objets à vendre",
            description: "Faire le tri dans la cave",
            personsAssigned: [users[0]]),
    
    TaskApp(title: "Appeler Camille l'installation",
            description: "Si pas dispo, voir avec Thomas",
            personsAssigned: [users[0],users[5],users[9]]),
    
    TaskApp(title: "Réserver l'emplacement du stand",
            description: "Auprès de la mairie",
            personsAssigned: [users[0]]),
    
    TaskApp(title: "Organiser un feu de joie",
            description: "Sécuriser la zone",
            isCompleted: true,
            isUrgent: true,
            personsAssigned: [users[0],users[2],users[7]]),
    
    TaskApp(title: "Prévoir un repas collectif",
            description: " Répartir les dépenses",
            personsAssigned: [users[8],users[10]]),
    
    TaskApp(title: "Ajouter les participants à la liste",
            personsAssigned: [users[7]]),
    TaskApp(
        title: "Réserver la salle de réception du Château de Chantilly",
        description: "Acompte à verser en amont.",
        isCompleted: false,
        isUrgent: true,
        personsAssigned: [sophie, thomas],
        showModifiers: false
    ),

    TaskApp(
        title: "Envoyer les invitations",
        description: "Se rendre chez l'imprimeur.",
        isCompleted: true,
        isUrgent: true,
        personsAssigned: [sophie],
        showModifiers: false
    ),

    TaskApp(
        title: "Trouver un traiteur",
        isCompleted: false,
        isUrgent: false,
        personsAssigned: [thomas],
        showModifiers: false
    ),
    TaskApp(
        title: "Organiser une dégustation",
        isCompleted: false,
        isUrgent: false,
        personsAssigned: [thomas, sophie],
        showModifiers: false
    ),


    TaskApp(
        title: "Choisir la robe de mariée",
        description: "Confirmer le rdv avec la boutique.",
        isCompleted: true,
        isUrgent: true,
        personsAssigned: [sophie, marion, emma, lola],
        showModifiers: false
    ),
    TaskApp(
        title: "Confirmer la disponibilité du stade municipal",
        description: "passer un appel à l'adjoint au maire",
        isCompleted: false,
        isUrgent: true,
        personsAssigned: [lucas],
        showModifiers: false
    ),

    TaskApp(
        title: "Contacter les équipes participantes",
        description: "Envoyer les invitations aux clubs locaux et organiser les inscriptions.",
        isCompleted: true,
        isUrgent: true,
        personsAssigned: [thomas, lucas],
        showModifiers: false
    ),

    TaskApp(
        title: "Prévoir les arbitres",
        description: "Engager des arbitres officiels pour encadrer les matchs.",
        isCompleted: false,
        isUrgent: true,
        personsAssigned: [lucas,alexandre],
        showModifiers: false
    ),

    TaskApp(
        title: "Organiser la buvette",
        description: "Prévoir un budget et du personnel pour la vente.",
        isCompleted: false,
        isUrgent: false,
        personsAssigned: [jules, alexandre],
        showModifiers: false
    ),

    TaskApp(
        title: "Créer et imprimer les affiches et flyers",
        isCompleted: true,
        isUrgent: false,
        personsAssigned: [lucas, jules, thomas],
        showModifiers: false
    )
]
