//
//  Tasks.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation
// Equatable sert à faire en sorte que mes objets soit comparables les uns les autres

struct TaskApp: Identifiable, Equatable {
    let id: UUID = UUID()
    
    var title: String
    var description: String?
    var isCompleted: Bool = false
    var isUrgent: Bool = false
    var personsAssigned: [Person]
    var showModifiers : Bool = false
}

