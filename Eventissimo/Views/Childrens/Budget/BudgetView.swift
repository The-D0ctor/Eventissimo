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
            ScrollView{
                VStack{
                    PickerChoices(choices: listOptions)
                    
                    
                    switch listOptions.selectedChoice {
                    case 0:
                        BudgetGlobalView(viewModel: BudgetViewModel(budget: budgetAnnivMarion))
                    case 1:
                        TasksView()
                    default:
                        Text("")
                    }
                }
                .padding(24)
            }
        }
    }
}

#Preview {
    BudgetView()
}
