//
//  OneBudgetCategoryView.swift
//  Eventissimo
//
//  Created by apprenant103 on 19/03/2025.
//

import SwiftUI

struct OneBudgetCategoryView: View {
    @State var apparait: Bool = true
    @Binding var spendings: [Spending]
    @State var key: EBudgetCategory
    @Binding var viewModel: BudgetViewModel
    var body: some View {
        
        
            if !spendings.isEmpty{
                
                VStack{
                    Button(action:{
                        apparait.toggle()
                    }, label:{
                        HStack{
                            Image(systemName: spendings[0].role.icon)
                            Text("\(key.rawValue)")
                                .jakarta(size: 14)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("\(viewModel.additionSpendingByCategory(listSpendings: spendings), specifier: "%.2f") €")
                                .jakarta(size: 14)
                                .fontWeight(.semibold)
                            if apparait{
                                Image(systemName: "chevron.down")
                            }else{
                                Image(systemName: "chevron.right")
                            }
                        }
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(key.color)
                    })
                    
                
                    if apparait {
                        VStack{
                            OneSpending(spend: spendings[0])
                            ForEach(spendings[1...]){spend in
                                Divider()
                                    .padding(.vertical, 5)
                                OneSpending(spend: spend)
                            }
                        }
                        .padding(.horizontal, 18)
                        .padding(.vertical, 8)
                    }
                }
            }
        
    }
}

#Preview {
    OneBudgetCategoryView(spendings: .constant(sprendingsAnnivMarion), key: .decorations, viewModel: Binding.constant(BudgetViewModel(evenement: events[0])))
}
