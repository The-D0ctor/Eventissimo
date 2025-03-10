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
    


              
}
var newEvent : [Event] = [
        Event(name: "Anniversaire de Marion",
              description: "Je vous convie à ma fête d'anniversaire, qui se promet d'être innoubliable!",
              date: .now,
              localization: "Lille",
              participants: newParticipant,
              image: "exempleImageEvent",
              tasks: newTaskApp,
              budget: newBudget[0],
              eventMessages: newMessageApp)
    ]
