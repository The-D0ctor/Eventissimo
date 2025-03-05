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
