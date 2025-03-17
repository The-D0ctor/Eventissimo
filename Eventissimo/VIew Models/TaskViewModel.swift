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
    
    func toogleIsCompleted(task: TaskApp) {
        // TODO: faire en sorte que ça modifie le boolean (isCompleted) de la task qui se situe dans ton tableau de task.
        // TODO: que ton ecran se rafraichisse
    }
    
    // Ancienne manière de faire pas filtrée et très contraignante pour le développeur
    
    //    @Published var myEvents : [Event] = events
    //    @Published var myTasks: [TaskApp] = [tasks[0],tasks[1]]
    
    //    @Published var lolaEvent : [Event] = [events[1]]
    //    @Published var lolaTasks: [TaskApp] = [tasks[2],tasks[3],tasks[4]]
    
    //Event(name: "Anniversaire de Marion",
    //      description: "Je vous convie à ma fête d'anniversaire, qui se promet d'être innoubliable!",
    //      date: .now,
    //      localization: "Lille",
    //      participants: newParticipant,
    //      image: "exempleImageEvent",
    //      tasks: newTaskApp,
    //      budget: newBudget[0],
    //      eventMessages: newMessageApp)
}
