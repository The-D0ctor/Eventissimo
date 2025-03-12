//
//  BudgetGlobalView.swift
//  Eventissimo
//
//  Created by apprenant103 on 07/03/2025.
//

import SwiftUI
import Charts

struct BudgetGlobalView: View {
    @State var viewModel: BudgetViewModel
    
    var body: some View {
        
        VStack{
            GeometryReader { geometry in
                ZStack{
                    Color.darkblue200.opacity(0.4)
                }
                HStack(spacing:0){
                    
                    ForEach(Array(viewModel.listSpendingsByCategory.keys), id: \.self) { key in
                        if let spendings = viewModel.listSpendingsByCategory[key]{
                            if !spendings.isEmpty{
                                Rectangle()
                                    .frame(width: geometry.size.width * (viewModel.additionSpendingByCategory(listSpendings: spendings)/100))
                                    .foregroundStyle(spendings[0].role.color)
                                
                            }}}
                    
                }
                
            }
            
            .frame(width: .infinity, height: 30)
            .clipShape(.rect(cornerRadius: 50))
            
            
            HStack{
                VStack{
                    Text("Total")
                        .jakarta(size: 14)
                        .bold()
                    
                        .padding(.bottom, 4)
                    Text("\(viewModel.budget.totalBudget, specifier: "%.0f") €")
                        .jakarta(size: 14)
                }
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green500, lineWidth: 1)
                )
                
                Spacer()
                VStack{
                    Text("Dépensé")
                        .jakarta(size: 14)
                        .bold()
                    
                        .padding(.bottom, 4)
                    Text("\(viewModel.budget.totalSpend, specifier: "%.2f") €")
                        .jakarta(size: 14)
                }
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green500, lineWidth: 1)
                )
                
                Spacer()
                VStack{
                    Text("Restant")
                        .jakarta(size: 14)
                        .bold()
                    
                        .padding(.bottom, 4)
                    Text("\(viewModel.budget.totalRemaining, specifier: "%.2f") €")
                        .jakarta(size: 14)
                }
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green500, lineWidth: 1)
                )
                
            }
            .padding()
            .foregroundStyle(Color.darkblue700)
            
            ForEach(Array(viewModel.listSpendingsByCategory.keys), id: \.self) { key in
                if let spendings = viewModel.listSpendingsByCategory[key]{
                    if !spendings.isEmpty{
                        
                        HStack{
                            Circle()
                                .foregroundStyle(spendings[0].role.color)
                                .frame(width: 14, height: 14)
                            Text(spendings[0].role.rawValue)
                                .jakarta(size: 16)
                            
                            Spacer()
                            
                            Text("\(viewModel.additionSpendingByCategory(listSpendings: spendings), specifier: "%.2f") €")
                        }
                        
                        
                    } }}
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.top)
        
        ForEach(Array(viewModel.listSpendingsByCategory.keys), id: \.self) { key in
            if let spendings = viewModel.listSpendingsByCategory[key]{
                if !spendings.isEmpty{
                    VStack{
                        HStack{
                            Text("\(key.rawValue)")
                                .jakarta(size: 16)
                            
                            Spacer()
                            
                            Text("\(viewModel.additionSpendingByCategory(listSpendings: spendings), specifier: "%.2f") €")
                        }
                        .padding()
                        .background(key.color)
                        
                        
                        
                        VStack{
                            
                            
                            
                            
                            OneSpending(spend: spendings[0])
                            
                            
                            ForEach(spendings[1...]){spend in
                                
                                Divider()
                                    .padding(.vertical, 5)
                                
                                OneSpending(spend: spend)
                            }
                            
                            
                        }
                        .padding()
                        
                    }
                }
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundStyle(.darkblue700)
        .padding(.top)
        
    }
}

#Preview {
    BudgetGlobalView(viewModel: BudgetViewModel(budget: budgetAnnivMarion))
}
