//
//  Spendings.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation

struct Spending: Identifiable {
    let id: UUID = UUID()
    
    var amount: Double
    var role: EBudgetCategory
    var description: String?
    var person: Person
}


var newSpendings : [Spending] = [
    Spending(amount: 22.5,
             role: .food,
             description: "Coca et Fanta",
             person: newPerson[1])
]
