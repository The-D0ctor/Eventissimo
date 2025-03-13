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
                        withAnimation(.easeInOut(duration: 0.2)) {
                            choices.selectedChoice = option
                        }
                    } label: {
                        Text(" \(choices.listChoices[option])")
                            .jakarta(size: 12)
                            .frame(maxWidth: .infinity)
                        
                    }
                    .bold(choices.selectedChoice == option)
                    .padding(.vertical, 8)
                    .foregroundStyle(choices.selectedChoice == option ? Color.white : Color.darkblue200)
                    .background(choices.selectedChoice == option ? choices.selectedButtonBackgroundColor : Color.clear)
                    .clipShape(Capsule())
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
    PickerChoices(choices:PickerChoiceViewModel( listChoices: ["Option 1", "Option 2"]))
}
