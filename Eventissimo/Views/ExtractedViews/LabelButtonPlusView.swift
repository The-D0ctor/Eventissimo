//
//  LabelButtonPlusView.swift
//  Eventissimo
//
//  Created by apprenant103 on 12/03/2025.
//

import SwiftUI

struct LabelButtonPlusView: View {
    var body: some View {
        Image("plus")
            .resizable()
            .frame(width: 30, height: 30)
            .padding(15)
            .background(Color.darkblue700)
            .clipShape(Circle())
            .foregroundStyle(.white)
    }
}

#Preview {
    LabelButtonPlusView()
}
