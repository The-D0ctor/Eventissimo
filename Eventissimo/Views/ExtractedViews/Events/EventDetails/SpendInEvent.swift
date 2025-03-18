//
//  SpendInEvent.swift
//  Eventissimo
//
//  Created by apprenant103 on 17/03/2025.
//

import SwiftUI

struct SpendInEvent: View {
    var spend: Spending
    var body: some View {
        HStack{
            
                Text(spend.descriptionSpend ?? "")
                    .jakarta(size: 12)
                    .fontWeight(.medium)
            
                
            .frame(width:180, alignment: .leading)
                Spacer()
            
                Text("\(spend.amount, specifier: "%.2f") €")
                    .jakarta(size: 12)
                    .fontWeight(.light)
                Spacer()
                (spend.person.profilePicture ?? Image(""))
                    .resizable()
                    .scaledToFill()
                    .frame(width:24, height: 24)
                    .clipShape(Circle())
            
            
            
            
            
        }
        .foregroundStyle(Color.darkblue200)
    }
}

#Preview {
    SpendInEvent(spend: sprendingsAnnivMarion[0])
}
