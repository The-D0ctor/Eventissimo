//
//  DataBase.swift
//  Eventissimo
//
//  Created by apprenant103 on 10/03/2025.
//

import Foundation

// MARK: - PERSON

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
    marion, alexandre, sophie, jules, camille, nicolas, elise, lola, thomas, emma
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

let events: [Event] = [
    Event(name: "Anniversaire de Marion",
          description: "Fêtez mes 30 ans avec moi ! Je vous attends à 19h at my house 😚",
          date: Date.now,
          localization: "Lyon - 18 rue du lac",
          participants: [Participant(person: users[0], role: .organizer), Participant(person: users[1], role: .guest), Participant(person: users[2], role: .guest), Participant(person: users[3], role: .guest)],
          image: "birthdayMarionEvent",
          tasks: [],
          budget: Budget(totalBudget: 0, spendings: []),
          eventMessages: []),
    Event(name: "Anniversaire de Lola",
          description: "Je vous invite à mon anniversaire ce week-end ! 🎉 Sur le thème films Disney, venez déguisés 😳",
          date: Calendar.current.date(from: DateComponents(year: 2025, month: 02, day: 12, hour: 19, minute: 0)) ?? Date(),
          localization: "Lyon - 250 rue Inkermann",
          participants: [Participant(person: users[0], role: .organizer), Participant(person: users[1], role: .guest), Participant(person: users[4], role: .guest), Participant(person: users[5], role: .guest), Participant(person: users[6], role: .guest), Participant(person: users[7], role: .guest)],
          image: "brithdayLolaEvent",
          tasks: newTaskApp,
          budget: Budget(totalBudget: 0, spendings: []),
          eventMessages: []),
    Event(name: "Nouvel an",
          description: "Mettre une description ici",
          date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 31)) ?? Date(),
          localization: "Tarare - 22 rue des peupliers",
          participants: [Participant(person: users[0], role: .guest), Participant(person: users[2], role: .guest), Participant(person: users[9], role: .guest), Participant(person: users[5], role: .guest), Participant(person: users[4], role: .guest)],
          image: "newYearEvent",
          tasks: [],
          budget: Budget(totalBudget: 0, spendings: []),
          eventMessages: []),
    Event(name: "Vide grenier",
          description: "Mettre une description ici",
          date: Calendar.current.date(from: DateComponents(year: 2024, month: 06, day: 29)) ?? Date(),
          localization: "Vauban - rue Principale",
          participants: [Participant(person: users[2], role: .guest), Participant(person: users[8], role: .guest), Participant(person: users[3], role: .guest), Participant(person: users[9], role: .guest)],
          image: "brocanteEvent",
          tasks: [],
          budget: Budget(totalBudget: 0, spendings: []),
          eventMessages: []),
    Event(name: "Fête de la Saint-Jean",
          description: "Mettre une description ici",
          date: Calendar.current.date(from: DateComponents(year: 2024, month: 06, day: 24)) ?? Date(),
          localization: "Sancé - salle des fêtes",
          participants: [Participant(person: users[0], role: .guest), Participant(person: users[6], role: .guest), Participant(person: users[3], role: .guest), Participant(person: users[8], role: .guest), Participant(person: users[7], role: .guest)],
          image: "village1Event",
          tasks: [],
          budget: Budget(totalBudget: 0, spendings: []),
          eventMessages: []),
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
                        person:Person(name: "Romain", email: "romain@gmail.com", pronouns: .heHim))
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

var newTaskApp : [TaskApp] = [
    TaskApp(title: "Aller chercher le gâteau",
            isCompleted: true, personsAssigned: users),
    
    TaskApp(title: "emballer le cadeau",
            personsAssigned: [alexandre, jules])
]
