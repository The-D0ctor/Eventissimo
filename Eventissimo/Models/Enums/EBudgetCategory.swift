//
//  EBudgetCategory.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//
import Foundation
import SwiftUI

enum EBudgetCategory: String, CaseIterable, Comparable {
    case food = "Alimentation"
    case transportation = "Hébergement et transport"
    case entertainment = "Animation"
    case decorations = "Décorations"
    case rentals = "Location de biens"
    case other = "Non déterminée"
    
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
    
    var icon: String {
        switch self {
        case .food:
            return "fork.knife"
        case .transportation:
            return "car.fill"
        case .entertainment:
            return "gamecontroller.fill"
        case .decorations:
            return "balloon.2.fill"
        case .rentals:
            return "house.fill"
        case .other:
            return  "seal.fill"
        }
    }
    
    static func < (a: EBudgetCategory, z: EBudgetCategory) -> Bool {
        if (a == .other) {
            return false
        } else if (z == .other) {
            return true
        }
        return a.rawValue < z.rawValue
    }
}
