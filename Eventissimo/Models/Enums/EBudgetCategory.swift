//
//  EBudgetCategory.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//
import Foundation
import SwiftUI

enum EBudgetCategory: String, CaseIterable {
    case food = "Alimentation"
    case transportation = "Transports et hébergement"
    case entertainment = "Animation"
    case decorations = "Décorations"
    case rentals = "Location de biens"
    case other = "Autre"
    
    var color: Color {
        switch self {
        case .food:
            return Color.green500
        case .transportation:
            return Color.redCategoryBudget
        case .entertainment:
            return Color.purpleCategoryBudget
        case .decorations:
            return Color.blueCategoryBudget
        case .rentals:
            return Color.darkBlueCategoryBudget
        case .other:
            return  Color.orangeCategoryBudget
        }
    }
}
