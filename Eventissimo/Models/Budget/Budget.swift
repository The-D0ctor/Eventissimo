//
//  Budget.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation



struct Budget: Identifiable {
    let id: UUID = UUID()
    var totalSpent: Double
    var totalBudget: Double
    var totalRemaining: Double { totalBudget - totalSpent }
    var spendings: [Spending]
}

var newBudget : [Budget] = [
    Budget(totalSpent: 115.50,
           totalBudget: 150.0,
           spendings: newSpendings)
]
