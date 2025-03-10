//
//  TeamQuestion.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 07/03/2025.
//

import SwiftUI

struct TeamQuestion: View {
    @State var text = ""
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 274, height: 340)
                .foregroundColor(.green200)
            
            VStack (alignment: .center, spacing: 20){
                Text("Une équipe pour s'organiser?")
                
                
                ScrollView {
                    
                    TextField("Nom", text: $text)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(20)
                    
                    TextField("Nom", text: $text)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(20)
                    
                    TextField("Nom", text: $text)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                Button {
                    // action qui ajoute un textField
                } label: {
                    Image("plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(15)
                        .background(Color.darkblue700)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                }
                
            }.padding(25)
                .multilineTextAlignment(.center)
            
            
        }.frame(width: 274, height: 340)
    }
}

#Preview {
    TeamQuestion()
}
