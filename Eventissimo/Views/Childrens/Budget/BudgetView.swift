//
//  Budget.swift
//  Eventissimo
//
//  Created by apprenant103 on 07/03/2025.
//

import SwiftUI

struct BudgetView: View {
    
    @State var listOptions: PickerChoiceViewModel = PickerChoiceViewModel( listChoices: ["Vue globale", "Dépenses récentes"])
    
    @State var viewModel: BudgetViewModel
    
    
    var body: some View {
        ZStack{
            Color.darkblue50
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    PickerChoices(choices: listOptions)
                    
                    
                    switch listOptions.selectedChoice {
                    case 0:
                        BudgetGlobalView(viewModel: viewModel)
                    case 1:
                        BudgetRecentView(budget: viewModel.budget)
                    default:
                        Text("")
                    }
                }
                .padding(24)
            }
            
            
            if viewModel.isActive {
                
                ZStack{
                    Color(.black.opacity(0.5))
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.isActive = !viewModel.isActive
                        }
                    
                    AddSpendingView(viewModel: viewModel)
                    
                    VStack{
                        Button(action: {
                            
                            viewModel.isActive = !viewModel.isActive
                            
                        }, label: {
                            LabelButtonPlusView()
                                .rotationEffect(.degrees(45))
                            
                        }).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    }
                    .padding(24)
                    
                }
                
            }
            else{
                VStack{
                    Button(action: {
                        
                        viewModel.isActive = !viewModel.isActive
                    }, label: {
                        LabelButtonPlusView()
                        
                    }).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                }
                .padding(24)
            }
        }
    }
}

#Preview {
    BudgetView(viewModel: BudgetViewModel(budget: budgetAnnivMarion))
}
