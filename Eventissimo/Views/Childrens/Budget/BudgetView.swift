//
//  Budget.swift
//  Eventissimo
//
//  Created by apprenant103 on 07/03/2025.
//

import SwiftUI

struct BudgetView: View {
    
    @State var listOptions: PickerChoiceViewModel = PickerChoiceViewModel( listChoices: ["Vue globale", "Dépenses récentes"])
    
    
    var body: some View {
        ZStack{
            Color.darkblue50
                .ignoresSafeArea()
            VStack{
                PickerChoices(choices: listOptions)
                    
                
                switch listOptions.selectedChoice {
                case 0:
                    BudgetGlobalView()
                case 1:
                    ProfileView(person: users[0])
                default:
                    Text("")
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    BudgetView()
}
