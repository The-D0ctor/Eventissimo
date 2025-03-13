//
//  BudgetRecentView.swift
//  Eventissimo
//
//  Created by apprenant103 on 12/03/2025.
//

import SwiftUI

struct BudgetRecentView: View {
    
    @State var budget: Budget
    var body: some View {
        VStack{
            ForEach(budget.spendings){ spending in
                OneSpending(spend: spending)
            }
        }
    }
}

#Preview {
    BudgetRecentView(budget: budgetAnnivMarion)
}
