//
//  Budget.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation
import Observation

@Observable
class Budget: Identifiable {
    let id: UUID = UUID()
    var totalSpend: Double
    var totalBudget: Double
    var totalRemaining: Double
    var spendings: [Spending]
    
    
    init(totalBudget: Double, spendings: [Spending]) {
        
        var spendingAmounts: Double = 0
        for spending in spendings {
            spendingAmounts += spending.amount
        }
        
        self.totalSpend = spendingAmounts
        self.totalBudget = totalBudget
        self.totalRemaining = totalBudget - spendingAmounts
        self.spendings = spendings
    }
    
    func addSpending(_ spending: Spending) {
        self.spendings.append(spending)
        self.totalSpend += spending.amount
        self.totalRemaining -= spending.amount
    }
    
    func getSpendingsByCaterory(category: EBudgetCategory) -> [Spending] {
        var listSpendings: [Spending] = []
        for spending in self.spendings {
            if spending.role == category {
                listSpendings.append(spending)
            }
        }
        return listSpendings
    }
}
