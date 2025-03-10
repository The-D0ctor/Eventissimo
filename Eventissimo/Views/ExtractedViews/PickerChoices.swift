//
//  Picker2Choices.swift
//  Eventissimo
//
//  Created by apprenant103 on 07/03/2025.
//

import SwiftUI


struct PickerChoices: View {
    
    @State var choices: PickerChoiceViewModel
    
    
    
    
    var body: some View {
        VStack{
            
            HStack {
                ForEach(choices.listChoices.indices, id: \.self) { option in
                    
                    Button {
                        choices.selectedChoice = option
                    } label: {
                        Text(" \(choices.listChoices[option])")
                            .jakarta(size: 12)
                            
                    }
                    .bold(choices.selectedChoice == option)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    
                    .foregroundStyle(choices.TextColor)
                    .background(choices.selectedChoice == option ? choices.selectedButtonBackgroundColor : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .padding(.vertical, 4)
                    .padding(.horizontal, 4)
                    
                }
            }
            .background(Color.white)
            
            .clipShape(RoundedRectangle(cornerRadius: 50))
            
            
        }
        .background(Color.darkblue50)
    }
}

#Preview {
    PickerChoices(choices: PickerChoiceViewModel( listChoices: ["Option 1", "Option 2"]))
}
