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
        EventApp(name: "Anniversaire de Marion",
              description: "Fêtez mes 30 ans avec moi ! Je vous attends à 19h chez moi 🎂🎉 Venez avec votre bonne humeur et prêts à danser toute la soirée !",
              date: Calendar.current.date(from: DateComponents(year: 2025, month: 02, day: 10, hour: 19, minute: 0)) ?? Date(),
              localization: "Lyon - 18 rue du lac",
              participants: [Participant(person: users[0], role: .organizer), Participant(person: users[1], role: .guest), Participant(person: users[2], role: .guest), Participant(person: users[3], role: .guest)],
              guests: allInvited,
              image: Image("birthdayMarionEvent"),
              tasks: [tasks[0], tasks[1]],
              budget: Budget(totalBudget: 200, spendings: sprendingsAnnivMarion),
              eventMessages: newMessageApp),
        
        EventApp(name: "Anniversaire de Lola",
              description: "Je vous invite à mon anniversaire ce week-end ! 🎉 Sur le thème films Disney, venez déguisés 😳 et préparez-vous pour un blind test musical et des jeux toute la soirée !",
              date: Calendar.current.date(from: DateComponents(year: 2025, month: 02, day: 12, hour: 19, minute: 0)) ?? Date(),
              localization: "Lyon - 250 rue Inkermann",
              participants: [Participant(person: users[0], role: .organizer), Participant(person: users[1], role: .guest), Participant(person: users[4], role: .guest), Participant(person: users[5], role: .guest), Participant(person: users[6], role: .guest), Participant(person: users[7], role: .guest)],
              guests: allInvited,
              image: Image("birthdayLolaEvent"),
              tasks: [tasks[2], tasks[3], tasks[4]],
              budget: Budget(totalBudget: 400, spendings: sprendingsAnnivMarion),
              eventMessages: []),
        
        EventApp(name: "Nouvel an",
              description: "Célébrons ensemble le passage à la nouvelle année ! 🎆 Buffet, musique et feu d’artifice à minuit. Venez avec une bonne résolution à partager !",
              date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 31, hour: 20, minute: 0)) ?? Date(),
              localization: "Tarare - 22 rue des peupliers",
              participants: [Participant(person: users[0], role: .guest), Participant(person: users[2], role: .guest), Participant(person: users[9], role: .guest), Participant(person: users[5], role: .guest), Participant(person: users[4], role: .guest)],
              guests: allInvited,
              image: Image("newYearEvent"),
              tasks: [tasks[5], tasks[6]],
              budget: Budget(totalBudget: 60, spendings: []),
              eventMessages: []),
        
        EventApp(name: "Vide grenier",
              description: "Venez chiner et trouver des trésors cachés ! 🛍️ De nombreux stands et animations sur place. Pensez à apporter votre monnaie et de quoi transporter vos trouvailles !",
              date: Calendar.current.date(from: DateComponents(year: 2024, month: 06, day: 29, hour: 8, minute: 30)) ?? Date(),
              localization: "Vauban - rue Principale",
              participants: [Participant(person: users[2], role: .guest), Participant(person: users[8], role: .guest), Participant(person: users[3], role: .guest), Participant(person: users[9], role: .guest)],
              guests: allInvited,
              image: Image("brocanteEvent"),
              tasks: [tasks[7], tasks[8], tasks[9]],
              budget: Budget(totalBudget: 1000, spendings: []),
              eventMessages: []),
        
        EventApp(name: "Fête de la Saint-Jean",
              description: "Célébrons la Saint-Jean autour d’un grand feu de joie, avec musique live et barbecue ! 🔥 Apportez vos grillades et vos instruments de musique 🎶",
              date: Calendar.current.date(from: DateComponents(year: 2024, month: 06, day: 24, hour: 18, minute: 0)) ?? Date(),
              localization: "Sancé - salle des fêtes",
              participants: [Participant(person: users[0], role: .guest), Participant(person: users[6], role: .guest), Participant(person: users[3], role: .guest), Participant(person: users[8], role: .guest), Participant(person: users[7], role: .guest)],
              guests: allInvited,
              image: Image("village1Event"),
              tasks: [tasks[10], tasks[11], tasks[12]],
              budget: Budget(totalBudget: 50, spendings: []),
              eventMessages: [])
    ]
    
    var privateConversations : [PrivateConversation] = [
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
}

var marion: Person = Person(
    name: "Marion Lanvin",
    email: "marion.lanvin@example.com",
    profilePicture: "marionProfilePicture",
    age: 30,
    description: "J'adore les blind tests et danser 🕺 !",
    pronouns: .sheHer,
    eventOrganized: 2,
    eventParticipated: 13)

var alexandre: Person = Person(
    name: "Alexandre Dupont",
    email: "alex.dupont@example.com",
    profilePicture: "alexProfilePicture",
    age: 28,
    description: "Passionné de randonnée et de photographie 📸.",
    pronouns: .heHim,
    eventOrganized: 5,
    eventParticipated: 8)

var sophie: Person = Person(
    name: "Sophie Martin",
    email: "sophie.martin@example.com",
    profilePicture: "sophieProfilePicture",
    age: 34,
    description: "Fan de cuisine et de voyages 🌍🍜.",
    pronouns: .sheHer,
    eventOrganized: 3,
    eventParticipated: 15)

var jules: Person = Person(
    name: "Jules Bernard",
    email: "jules.bernard@example.com",
    profilePicture: "julesProfilePicture",
    age: 22,
    description: "Gamer invétéré et amateur de café ☕🎮.",
    pronouns: .heHim,
    eventOrganized: 1,
    eventParticipated: 9)

var camille: Person = Person(
    name: "Camille Lefevre",
    email: "camille.lefevre@example.com",
    profilePicture: "camilleProfilePicture",
    age: 26,
    description: "Amatrice de danse et de yoga 🧘‍♀️💃.",
    pronouns: .sheHer,
    eventOrganized: 4,
    eventParticipated: 12)

var nicolas : Person = Person(
    name: "Nicolas Moreau",
    email: "nicolas.moreau@example.com",
    profilePicture: "nicolasProfilePicture",
    age: 40,
    description: "Musicien et grand fan de jazz 🎷🎶",
    pronouns: .heHim,
    eventOrganized: 6,
    eventParticipated: 20)

var elise: Person = Person(
    name: "Élise Perrin",
    email: "elise.perrin@example.com",
    profilePicture: "eliseProfilePicture",
    age: 31,
    description: "Adore les escape games et les thrillers 🔍🎭",
    pronouns: .sheHer,
    eventOrganized: 2,
    eventParticipated: 14)

var lucas: Person = Person(
    name: "Lucas Girard",
    email: "lucas.girard@example.com",
    profilePicture: "lucasProfilePicture",
    age: 21,
    description: "Toujours partant pour un foot entre amis ⚽",
    pronouns: .heHim,
    eventOrganized: 0,
    eventParticipated: 7)

var lola: Person = Person(
    name: "Lola Dubois",
    email: "lola.dubois@example.com",
    profilePicture: "lolaProfilePicture",
    age: 29,
    description: "Grande lectrice et adepte de jeux de société 📚🎲",
    pronouns: .sheHer,
    eventOrganized: 3,
    eventParticipated: 10)

var thomas: Person = Person(
    name: "Thomas Leroy",
    email: "thomas.leroy@example.com",
    profilePicture: "thomasProfilePicture",
    age: 35,
    description: "Cycliste et amateur de bonne cuisine 🚴‍♂️🍽️",
    pronouns: .heHim,
    eventOrganized: 5,
    eventParticipated: 11)

var emma: Person = Person(
    name: "Emma Rousseau",
    email: "emma.rousseau@example.com",
    profilePicture: "emmaProfilePicture",
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
var allInvited = [Participant(person: marion, role: nil), Participant(person: alexandre, role: nil), Participant(person: sophie, role: nil), Participant(person: jules, role: nil), Participant(person: camille, role: nil), Participant(person: nicolas, role: nil), Participant(person: elise, role: nil), Participant(person: thomas, role: nil), Participant(person: emma, role: nil)]

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

let events: [EventApp] = [
    EventApp(name: "Anniversaire de Marion",
          description: "Fêtez mes 30 ans avec moi ! Je vous attends à 19h chez moi 🎂🎉 Venez avec votre bonne humeur et prêts à danser toute la soirée !",
          date: Calendar.current.date(from: DateComponents(year: 2025, month: 02, day: 10, hour: 19, minute: 0)) ?? Date(),
          localization: "Lyon - 18 rue du lac",
          participants: [Participant(person: users[0], role: .organizer), Participant(person: users[1], role: .guest), Participant(person: users[2], role: .guest), Participant(person: users[3], role: .guest)],
          guests: allInvited,
          image: Image("birthdayMarionEvent"),
          tasks: [tasks[0], tasks[1]],
          budget: Budget(totalBudget: 200, spendings: sprendingsAnnivMarion),
          eventMessages: newMessageApp),
    
    EventApp(name: "Anniversaire de Lola",
          description: "Je vous invite à mon anniversaire ce week-end ! 🎉 Sur le thème films Disney, venez déguisés 😳 et préparez-vous pour un blind test musical et des jeux toute la soirée !",
          date: Calendar.current.date(from: DateComponents(year: 2025, month: 02, day: 12, hour: 19, minute: 0)) ?? Date(),
          localization: "Lyon - 250 rue Inkermann",
          participants: [Participant(person: users[0], role: .organizer), Participant(person: users[1], role: .guest), Participant(person: users[4], role: .guest), Participant(person: users[5], role: .guest), Participant(person: users[6], role: .guest), Participant(person: users[7], role: .guest)],
          guests: allInvited,
          image: Image("birthdayLolaEvent"),
          tasks: [tasks[2], tasks[3], tasks[4]],
          budget: Budget(totalBudget: 400, spendings: sprendingsAnnivMarion),
          eventMessages: []),
    
    EventApp(name: "Nouvel an",
          description: "Célébrons ensemble le passage à la nouvelle année ! 🎆 Buffet, musique et feu d’artifice à minuit. Venez avec une bonne résolution à partager !",
          date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 31, hour: 20, minute: 0)) ?? Date(),
          localization: "Tarare - 22 rue des peupliers",
          participants: [Participant(person: users[0], role: .guest), Participant(person: users[2], role: .guest), Participant(person: users[9], role: .guest), Participant(person: users[5], role: .guest), Participant(person: users[4], role: .guest)],
          guests: allInvited,
          image: Image("newYearEvent"),
          tasks: [tasks[5], tasks[6]],
          budget: Budget(totalBudget: 60, spendings: []),
          eventMessages: []),
    
    EventApp(name: "Vide grenier",
          description: "Venez chiner et trouver des trésors cachés ! 🛍️ De nombreux stands et animations sur place. Pensez à apporter votre monnaie et de quoi transporter vos trouvailles !",
          date: Calendar.current.date(from: DateComponents(year: 2024, month: 06, day: 29, hour: 8, minute: 30)) ?? Date(),
          localization: "Vauban - rue Principale",
          participants: [Participant(person: users[2], role: .guest), Participant(person: users[8], role: .guest), Participant(person: users[3], role: .guest), Participant(person: users[9], role: .guest)],
          guests: allInvited,
          image: Image("brocanteEvent"),
          tasks: [tasks[7], tasks[8], tasks[9]],
          budget: Budget(totalBudget: 1000, spendings: []),
          eventMessages: []),
    
    EventApp(name: "Fête de la Saint-Jean",
          description: "Célébrons la Saint-Jean autour d’un grand feu de joie, avec musique live et barbecue ! 🔥 Apportez vos grillades et vos instruments de musique 🎶",
          date: Calendar.current.date(from: DateComponents(year: 2024, month: 06, day: 24, hour: 18, minute: 0)) ?? Date(),
          localization: "Sancé - salle des fêtes",
          participants: [Participant(person: users[0], role: .guest), Participant(person: users[6], role: .guest), Participant(person: users[3], role: .guest), Participant(person: users[8], role: .guest), Participant(person: users[7], role: .guest)],
          guests: allInvited,
          image: Image("village1Event"),
          tasks: [tasks[10], tasks[11], tasks[12]],
          budget: Budget(totalBudget: 50, spendings: []),
          eventMessages: [])
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
    Spending(amount: 22.5,
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
    Spending(amount: 22.5,
             role: .decorations,
             descriptionSpend: "Coca et Fanta",
             person: users[0])
]

var sprendingsFeteSaintJean : [Spending] = [
    Spending(amount: 22.5,
             role: .decorations,
             descriptionSpend: "Coca et Fanta",
             person: users[0])
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
            personsAssigned: [users[7]])
    
]
