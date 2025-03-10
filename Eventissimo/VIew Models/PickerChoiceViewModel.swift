//
//  PickerChoiceViewModel.swift
//  Eventissimo
//
//  Created by apprenant103 on 07/03/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable
class PickerChoiceViewModel: Identifiable {
    var id = UUID()
    var selectedChoice: Int
    var listChoices: [String]
    var selectedButtonBackgroundColor: Color = .green500
    var TextColor: Color = .darkblue700
   

    
    
    init(listChoices: [String], selectedChoice: Int = 0) {
        self.id = UUID()
        self.selectedChoice = selectedChoice
        self.listChoices = listChoices
        
    }
    
    
}


//enum PickerSelectionType {
//    case 1
//    case 2
//    case 3
//    case 4
//    case 5
//}
