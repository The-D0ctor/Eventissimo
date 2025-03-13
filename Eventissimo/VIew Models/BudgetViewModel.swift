//
//  BudgetViewModel.swift
//  Eventissimo
//
//  Created by apprenant103 on 11/03/2025.
//

import Foundation
import Observation

@Observable
class BudgetViewModel {
    var budget: Budget
    var listSpendingsByCategory: Dictionary<EBudgetCategory, [Spending]>
    var isActive: Bool = false
    
    var newAmount: Double = 0.0
    
    var selectedCategory: EBudgetCategory = .other
    
    var addDescription: String = ""
    
    init(budget: Budget) {
        self.budget = budget
        
        var spendingsByCategory: Dictionary<EBudgetCategory, [Spending]> = [:]
        for category in EBudgetCategory.allCases {
            spendingsByCategory[category] = budget.getSpendingsByCaterory(category: category)
        }
        self.listSpendingsByCategory = spendingsByCategory
    }
    
    func additionSpendingByCategory(listSpendings: [Spending]) -> Double{
        var sommeSpending: Double = 0
        for spending in listSpendings {
                sommeSpending += spending.amount
        }
        return sommeSpending
    }
    
    
    func addSpending(spending: Spending) {
        budget.addSpending(spending)
        var spendingsByCategory: Dictionary<EBudgetCategory, [Spending]> = [:]
        for category in EBudgetCategory.allCases {
            spendingsByCategory[category] = budget.getSpendingsByCaterory(category: category)
        }
        self.listSpendingsByCategory = spendingsByCategory
    }
    
    
}

