//
//  EBudgetCategory.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//
import Foundation
import SwiftUI

enum EBudgetCategory: String {
    case food = "Nourriture"
    case transportation = "Transports et hébergement"
    case entertainment = "Animation"
    case decorations = "Décorations"
    case rentals = "Location de biens"
    case other = "Autre"
    
    var color: Color {
        switch self {
        case .food:
            return .green500
        case .transportation:
            return .init(red: 207/255, green: 120/255, blue: 120/255)
        case .entertainment:
            return .init(red: 195/255, green: 120/255, blue: 207/255)
        case .decorations:
            return .init(red: 120/255, green: 188/255, blue: 207/255)
        case .rentals:
               return .init(red: 120/255, green: 126/255, blue: 207/255)
        case .other:
             return   .init(red: 220/255, green: 152/255, blue: 103/255)
        }
    }
}
