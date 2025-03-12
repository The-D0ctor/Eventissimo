//
//  TaskModelView.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import Foundation


class TaskViewModel: ObservableObject {
    
    @Published var tasks: [TaskApp] = []
    
// on filtre tous les évents où l'utilisateur connecté est particpant via son ID ( computed proprety)
    
    var myEvents = events.filter { event in
        event.participants.contains { $0.person.id == users[0].id }
    }
    
    // same avec filtrage des tâches (celle ci utilise une fonction)
    func getUserEventTasks(event: Event) -> [TaskApp] {
        return event.tasks.filter { task in
            task.personsAssigned.contains { $0.id == users[0].id }
        }
    }
    
    func toogleIsCompleted(task: TaskApp) {
       // TODO: faire en sorte que ça modifie le boolean (isCompleted) de la task qui se situe dans ton tableau de task.
    // TODO: que ton ecran se rafraichisse
    }

    
    
    
    
    
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
