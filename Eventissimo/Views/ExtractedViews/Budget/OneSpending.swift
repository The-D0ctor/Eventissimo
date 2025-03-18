//
//  OneSpending.swift
//  Eventissimo
//
//  Created by apprenant103 on 11/03/2025.
//

import SwiftUI

struct OneSpending: View {
    
    var spend:Spending
    var body: some View {
        HStack{
            (spend.person.profilePicture ?? Image(""))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text(spend.person.name)
                    .jakarta(size: 14)
                    .fontWeight(.medium)
                
                Text(spend.descriptionSpend ?? "")
                    .jakarta(size: 13)
                    .foregroundStyle(.darkblue400)
            }
            .padding(.leading, 4)
            Spacer()
            Text("\(spend.amount, specifier: "%.2f") €")
                .jakarta(size: 13)
        
        }
    }
}

#Preview {
    OneSpending(spend: sprendingsAnnivMarion[0])
}
