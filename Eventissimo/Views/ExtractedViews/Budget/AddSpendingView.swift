//
//  AddSpendingView.swift
//  Eventissimo
//
//  Created by apprenant103 on 13/03/2025.
//

import SwiftUI

struct AddSpendingView: View {
    var dataBase: DataBase
    
    @State var viewModel: BudgetViewModel
    
    var body: some View {

            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Dépense")
                        .jakarta(size: 16)
                        
                    TextField("À quoi correspond cette dépense ?", text: $viewModel.addDescription)
                        .padding()
                        .background(.white)
                        .frame(width: 354, height: 40)
                        .cornerRadius(8)
                }
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Montant")
                            .jakarta(size: 16)
                            
                        HStack(spacing: 4) {
                            
                            TextField("0", value: $viewModel.newAmount, format: .number)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 100, height: 40)
                                .background(.white)
                                .cornerRadius(8)
                            
                            Text("€")
                                .foregroundColor(.darkblue700)
                                .font(.title2)
                        }
                        .padding(.bottom, 16)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Catégorie")
                            .jakarta(size: 16)
                            
                        Picker("", selection: $viewModel.selectedCategory) {
                            ForEach(viewModel.listSpendingsByCategory.keys.sorted(), id: \.self) { key in
                                Text(key.rawValue).tag(key)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .frame(height: 40)
                        .background(.white)
                        .cornerRadius(8)
                        .tint(.green650)}
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        if viewModel.newAmount != 0 {
                            viewModel.addSpending(spending: Spending(amount: viewModel.newAmount, role: viewModel.selectedCategory, descriptionSpend: viewModel.addDescription, person: dataBase.currentUser))
                            viewModel.selectedCategory = .other
                            viewModel.newAmount = 0
                            viewModel.addDescription = ""
                            viewModel.isActive.toggle()
                        }
                    }) {
                        Text("Ajouter")
                            .jakarta(size: 16)
                            .padding()
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                            .frame(width: 150)
                            .background(Color.green650)
                            .cornerRadius(12)
                    }
                    Spacer()
                }
            }
            .padding(24)
            .background(.darkblue50)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    AddSpendingView(dataBase: DataBase(), viewModel: BudgetViewModel(evenement: events[0]))
        .environment(DataBase())
}
