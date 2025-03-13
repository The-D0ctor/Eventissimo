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

