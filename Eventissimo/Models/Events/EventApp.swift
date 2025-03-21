//
//  Event.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation
import SimpleCalendar
import SwiftUI

struct EventApp: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var date: Date
    var localization: String
    var participants: [Participant]
    var listUsers: [Participant] {
        allInvited.filter { participant in
            !participants.contains { $0.person.id == participant.person.id } && !nonParticipants.contains { $0.person.id == participant.person.id }
        }
    }
    
    var nonParticipants: [Participant]

    
    var image: Image?
    var tasks: [TaskApp]
    var budget: Budget
    var eventMessages: [MessageApp]
    
    var tasksPercentage: Int { // 🙋‍♀️ Pourcentage de tâches complétées
        let completedTasks = tasks.filter { $0.isCompleted }.count
        return tasks.isEmpty ? 0 : Int(Double(completedTasks) / Double(tasks.count) * 100)
    }
    
    var calendarEvent: CalendarEvent {
        CalendarEvent(
            id: id.uuidString,
            startDate: date,
            activity: CalendarActivity(id: id.uuidString, title: name, description: description, mentors: participants.filter({ participant in
                participant.role == .organizer
            }).map({ participant in
                participant.person.name
            }), type: ActivityType(name: "", color: .green700), duration: 60 * 60)
        )
    }
}
