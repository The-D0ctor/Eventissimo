//
//  TaskModelView.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable
class TaskViewModel {
    var dataBase: DataBase
    var tasks: [TaskApp] = []
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
    
    // same avec filtrage des tâches (celle ci utilise une fonction)
    func getUserEventTasks(event: EventApp) -> Binding<[TaskApp]> {
        return Binding {
            event.tasks.filter { task in
                task.personsAssigned.contains { $0.id == self.dataBase.currentUser.id }
            }
        } set: { newTasks in
            if let eventIndex = self.dataBase.events.firstIndex(where: { dataBaseEvent in
                dataBaseEvent.id == event.id
            }) {
                for newTask in newTasks {
                    if let taskIndex = event.tasks.firstIndex(where: { task in
                        task.id == newTask.id
                    }) {
                        self.dataBase.events[eventIndex].tasks[taskIndex] = newTask
                    }
                }
            }
        }

    }
}
