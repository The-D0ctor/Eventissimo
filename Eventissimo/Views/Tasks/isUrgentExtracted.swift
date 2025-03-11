//
//  isUrgentExtracted.swift
//  Eventissimo
//
//  Created by apprenant104 on 10/03/2025.
//

import SwiftUI

struct isUrgentExtracted: View {
    var body: some View {
        Text("Urgent")
            .foregroundStyle(.white)
            .font(.system(size: 12))
            .fontWeight(.bold)
            .padding(.all,6)
            .background(.darkblue700)
            .cornerRadius(6)
    }
}

#Preview {
    isUrgentExtracted()
}
