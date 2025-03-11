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
    
    var tasksPercentage: Int { // 🙋‍♀️ Pourcentage de tâches complétées
        let completedTasks = tasks.filter { $0.isCompleted }.count
        return tasks.isEmpty ? 0 : Int(Double(completedTasks) / Double(tasks.count) * 100)
    }
}
