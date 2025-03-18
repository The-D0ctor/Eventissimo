//
//  isUrgentExtracted.swift
//  Eventissimo
//
//  Created by apprenant104 on 10/03/2025.
//

import SwiftUI

struct isUrgentExtracted: View {
    @State var urgentColor : Color
    var body: some View {
        //        Text("Urgent")
        //            .foregroundStyle(.white)
        //            .jakarta(size: 12)
        //            .fontWeight(.bold)
        //            .padding(.all,6)
        //            .background(.darkblue700)
        //            .cornerRadius(6)
        
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 40,height: 40)
                .foregroundStyle(.darkblue50)
                .opacity(0.5)
            VStack {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundStyle(urgentColor)
                
                Text("Urgent")
                    .jakarta(size: 10)
                    .foregroundStyle(urgentColor)
                
            }
        }
        
    }
}

#Preview {
    isUrgentExtracted(urgentColor: .darkblue700)
}
