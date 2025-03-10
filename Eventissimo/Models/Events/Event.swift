//
//  Event.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation

struct Event: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var date: Date
    var localization: String
    var participants: [Participant]
    var image: String
    var tasks: [TaskApp]
    var budget: Budget
    var eventMessages: [MessageApp]
}

let events: [Event] = [
    Event(name: "Anniversaire de Marion",
          description: "Fêtez mes 30 ans avec moi ! Je vous attends à 19h at my house 😚",
          date: Date.now,
          localization: "Lyon - 18 rue du lac",
          participants: [Participant(person: users[0], role: .organizer)],
          image: "birthdayMarionEvent",
          tasks: [],
          budget: Budget(totalSpent: 0, totalBudget: 0, spendings: []),
          eventMessages: []),
    Event(name: "Anniversaire de Lola",
          description: "Mettre une description ici",
          date: Calendar.current.date(from: DateComponents(year: 2025, month: 02, day: 12)) ?? Date(),
          localization: "Lyon - 250 rue Inkermann",
          participants: [Participant(person: users[0], role: .guest)],
          image: "brithdayLolaEvent",
          tasks: [],
          budget: Budget(totalSpent: 0, totalBudget: 0, spendings: []),
          eventMessages: []),
    Event(name: "Nouvel an",
          description: "Mettre une description ici",
          date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 31)) ?? Date(),
          localization: "Tarare - 22 rue des peupliers",
          participants: [Participant(person: users[0], role: .guest)],
          image: "newYearEvent",
          tasks: [],
          budget: Budget(totalSpent: 0, totalBudget: 0, spendings: []),
          eventMessages: []),
    Event(name: "Vide grenier",
          description: "Mettre une description ici",
          date: Calendar.current.date(from: DateComponents(year: 2024, month: 06, day: 29)) ?? Date(),
          localization: "Vauban - rue Principale",
          participants: [],
          image: "brocanteEvent",
          tasks: [],
          budget: Budget(totalSpent: 0, totalBudget: 0, spendings: []),
          eventMessages: []),
    Event(name: "Fête de la Saint-Jean",
          description: "Mettre une description ici",
          date: Calendar.current.date(from: DateComponents(year: 2024, month: 06, day: 24)) ?? Date(),
          localization: "Sancé - salle des fêtes",
          participants: [Participant(person: users[0], role: .guest)],
          image: "village1Event",
          tasks: [],
          budget: Budget(totalSpent: 0, totalBudget: 0, spendings: []),
          eventMessages: []),
]
