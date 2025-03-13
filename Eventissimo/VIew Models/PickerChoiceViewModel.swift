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
    var selectedButtonBackgroundColor: Color
    var textColor: Color
    
    init(listChoices: [String], selectedChoice: Int = 0, selectedButtonBackgroundColor: Color = .green650, textColor: Color = .darkblue700) {
        self.id = UUID()
        self.selectedChoice = selectedChoice
        self.listChoices = listChoices
        self.selectedButtonBackgroundColor = selectedButtonBackgroundColor
        self.textColor = textColor
    }
}
