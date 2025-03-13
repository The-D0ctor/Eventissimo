//
//  AddSpendingView.swift
//  Eventissimo
//
//  Created by apprenant103 on 13/03/2025.
//

import SwiftUI

struct AddSpendingView: View {
    
    @State var viewModel: BudgetViewModel
    
    var body: some View {
        VStack{
            Text("Ajouter une dépense")
                .jakarta(size: 20)
            
            TextField("0", value: $viewModel.newAmount, format: .number)
            
            TextField("À quoi correspond cette dépense ?", text: $viewModel.addDescription)
            
            Text("Catégorie")
            Picker("", selection: $viewModel.selectedCategory){
                
                ForEach(viewModel.listSpendingsByCategory.keys.sorted(), id: \.self) { key in
                    
                    Text(key.rawValue).tag(key)
                }
                
                
            }
            
            Button(action:{
                if viewModel.newAmount != 0{
                    viewModel.addSpending(spending: Spending(amount: viewModel.newAmount, role: viewModel.selectedCategory, descriptionSpend: viewModel.addDescription, person: alexandre))
                    viewModel.selectedCategory = .other
                    viewModel.newAmount = 0
                    viewModel.addDescription = ""
                    viewModel.isActive = !viewModel.isActive
                }
            }, label:{
                Text("Ajouter la dépense")
                    .jakarta(size: 16)
                    .padding()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.green500)
                
                    .cornerRadius(10)
                
            })
            
        }
        .padding()
        .background(Color.white)
        .foregroundStyle(.darkblue700)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(24)
    }
}

#Preview {
    AddSpendingView(viewModel: BudgetViewModel(budget: budgetAnnivMarion))
}
