//
//  TaskModelView.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import Foundation
//import Observation

//@Observable
class TaskViewModel: ObservableObject{
    
    @Published var myEvents : [Event] = [events[0]]
    @Published var myTasks: [TaskApp] = tasks
}
//Event(name: "Anniversaire de Marion",
//      description: "Je vous convie à ma fête d'anniversaire, qui se promet d'être innoubliable!",
//      date: .now,
//      localization: "Lille",
//      participants: newParticipant,
//      image: "exempleImageEvent",
//      tasks: newTaskApp,
//      budget: newBudget[0],
//      eventMessages: newMessageApp)
