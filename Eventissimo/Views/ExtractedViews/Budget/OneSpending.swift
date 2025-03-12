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
            Image(spend.person.profilePicture ?? "marionProfilPicture")
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipped()
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text(spend.person.name)
                    .jakarta(size: 16)
                
                Text(spend.descriptionSpend ?? "")
                    .jakarta(size: 14)
                    .foregroundStyle(.darkblue400)
            }
            Spacer()
            Text("\(spend.amount, specifier: "%.2f") €")
        }
    }
}

#Preview {
    OneSpending(spend: sprendingsAnnivMarion[0])
}
