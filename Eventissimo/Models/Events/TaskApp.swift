//
//  Tasks.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation

struct TaskApp: Identifiable {
    let id: UUID = UUID()
    
    var title: String
    var description: String?
    var isCompleted: Bool = false
    var isUrgent: Bool = false
    var personsAssigned: [Person]

}

var tasks: [TaskApp] = [
    TaskApp(title: "Aller chercher le gâteau",
            description: "rendez-vous prévu à 13H15",
            isUrgent: true,
            personsAssigned: users),
    TaskApp(title: "Gonfler les ballons",
            isCompleted: true,
            personsAssigned: users)
]
