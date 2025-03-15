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
            
                VStack{
                    BudgetGlobalView(viewModel: viewModel)
                        
                }
            
                .padding(24)
            
            
            if viewModel.isActive {
                
                ZStack{
                    Color(.black.opacity(0.5))
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.isActive = !viewModel.isActive
                        }
                    
                    AddSpendingView(viewModel: viewModel)
                    
                }
                
            }
            
        }
        .navigationTitle(viewModel.evenement.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    SettingsGeneralView()
                } label: {
                    VStack{
                        Button(action: {
                            
                            viewModel.isActive = !viewModel.isActive
                            
                        }, label: {
                            Image("plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(10)
                                .background(Color.darkblue700)
                                .clipShape(Circle())
                                .foregroundStyle(.white)
                                .rotationEffect(.degrees(
                                    viewModel.isActive ? 45 : 0))
                                
                            
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    BudgetView(viewModel: BudgetViewModel(evenement: events[0]))
}
