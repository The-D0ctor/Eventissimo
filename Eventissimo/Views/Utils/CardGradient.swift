//
//  CardGradient.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 10/03/2025.
//

import SwiftUI

struct CardGradient: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(red: 36/255, green: 41/255, blue: 39/255, opacity: 0.6), Color.clear]),
                       startPoint: .bottom,
                       endPoint: .top)
        .frame(width: width, height: height)
        .cornerRadius(20)
        .padding(.bottom, 0)
    }
}

#Preview {
    CardGradient(width: 210, height: 310)
}
