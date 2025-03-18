//
//  Budget.swift
//  Eventissimo
//
//  Created by apprenant103 on 07/03/2025.
//

import SwiftUI

struct BudgetView: View {
    @Environment(\.dismiss) var dismiss
    var dataBase: DataBase
    
    @State var listOptions: PickerChoiceViewModel = PickerChoiceViewModel( listChoices: ["Vue globale", "Dépenses récentes"])
    
    @State var viewModel: BudgetViewModel
    
    
    var body: some View {
        ZStack{
            Color.darkblue50
                .ignoresSafeArea()
            
                VStack{
                    BudgetGlobalView(viewModel: viewModel)
                        
                }
            
                .padding([.horizontal], 24)
            
            
            if viewModel.isActive {
                
                ZStack{
                    Color(.black.opacity(0.5))
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.isActive = !viewModel.isActive
                        }
                    
                    AddSpendingView(dataBase: dataBase, viewModel: viewModel)
                    
                }
                
            }
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    viewModel.evenement.image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text(viewModel.evenement.name)
                        .serif(size: 18)
                        .fontWeight(.medium)
                        .padding(.leading, 8)
                    }
                .foregroundColor(.darkblue900)
            }
            ToolbarItem(placement: .topBarTrailing) {
                
                    VStack{
                        Button(action: {
                            
                            viewModel.isActive = !viewModel.isActive
                            
                        }, label: {
                            Image("plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(10)
                                .background(.green650)
                                .clipShape(Circle())
                                .foregroundStyle(.white)
                                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
                                .rotationEffect(.degrees(
                                    viewModel.isActive ? 45 : 0))
                            
                            
                        })
                    }
            }
        }
    }
}

#Preview {
    BudgetView(dataBase: DataBase(), viewModel: BudgetViewModel(evenement: events[0]))
}
