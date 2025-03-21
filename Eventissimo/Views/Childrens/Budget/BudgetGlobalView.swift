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
        Text("")
        ScrollView{
            VStack{
                GeometryReader { geometry in
                    ZStack{
                        Color.darkblue200.opacity(0.4)
                    }
                    HStack(spacing:0){
                        ForEach(viewModel.listSpendingsByCategory.keys.sorted(), id: \.self) { key in
                            if let spendings = viewModel.listSpendingsByCategory[key]{
                                if !spendings.isEmpty{
                                    Rectangle()
                                        .frame(width: geometry.size.width * (viewModel.additionSpendingByCategory(listSpendings: spendings)/viewModel.budget.totalBudget))
                                        .foregroundStyle(spendings[0].role.color)
                                }}}
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 30)
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
                    .frame(width: 80, height: 48)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green500, lineWidth: 1))
                    Spacer()
                    VStack{
                        Text("Dépensé")
                            .jakarta(size: 14)
                            .bold()
                            .padding(.bottom, 4)
                        Text("\(viewModel.budget.totalSpend, specifier: "%.2f") €")
                            .jakarta(size: 14)
                    }
                    .frame(width: 80, height: 48)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green500, lineWidth: 1))
                    Spacer()
                    VStack{
                        Text("Restant")
                            .jakarta(size: 14)
                            .bold()
                            .padding(.bottom, 4)
                        Text("\(viewModel.budget.totalRemaining, specifier: "%.2f") €")
                            .jakarta(size: 14)
                    }
                    .frame(width: 80, height: 48)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green500, lineWidth: 1))
                }
                .padding(.vertical)
                .foregroundStyle(Color.darkblue700)
                
                ForEach(viewModel.listSpendingsByCategory.keys.sorted(), id: \.self) { key in
                    if let spendings = viewModel.listSpendingsByCategory[key]{
                        if !spendings.isEmpty{
                            
                            HStack{
                                Circle()
                                    .foregroundStyle(spendings[0].role.color)
                                    .frame(width: 14, height: 14)
                                Image(systemName: spendings[0].role.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                Text(spendings[0].role.rawValue)
                                    .jakarta(size: 14)
                                Spacer()
                                Text("\(viewModel.additionSpendingByCategory(listSpendings: spendings), specifier: "%.2f") €")
                                    .jakarta(size: 14)
                                    .fontWeight(.light)
                            }
                        }
                        
                        
                    }}
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.top)
            
            ForEach(viewModel.listSpendingsByCategory.keys.sorted(), id: \.self) { key in
                if let spendings = viewModel.listSpendingsByCategory[key]{
                    
                    let spendingsBinding = Binding(
                                get: { spendings },
                                set: { viewModel.listSpendingsByCategory[key] = $0 }
                            )

                    
                    OneBudgetCategoryView(spendings: spendingsBinding, key: key, viewModel: $viewModel)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(.darkblue700)
            .padding(.top)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    BudgetGlobalView(viewModel: BudgetViewModel(evenement: events[6]))
}
