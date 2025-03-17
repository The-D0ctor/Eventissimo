//
//  ParameterAppView.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 14/03/2025.
//

import SwiftUI

struct ParameterAppView: View {
    @State var toggle = true
    @State var toggleBis = false
    var body: some View {
        ZStack {
            Color.darkblue50.ignoresSafeArea()
            VStack (spacing: 30) {
                Text("Paramètres de l'application")
                    .serif(size: 24)
                    .fontWeight(.bold)
                    .foregroundStyle(.darkblue700)
                    .padding(.bottom, 20)
                VStack (alignment: .leading, spacing: 25){
                    
                    
                    Toggle(isOn: $toggle) {
                        Text("Mode sombre")
                            .jakarta(size: 16)
                    }
                    .tint(.green650)
                    
                    Toggle(isOn: $toggleBis) {Text("Autoriser les notifications").jakarta(size: 16) }
                        .tint(.green650)
                    HStack{
                        Text("Langues")
                            .jakarta(size: 16)
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    
                    
                }
                Spacer()
            }.padding(24)
        }
        
    }
}

#Preview {
    ParameterAppView()
}
