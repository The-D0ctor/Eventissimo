//
//  EventQuestionCard.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 07/03/2025.
//

import SwiftUI

struct NameEventQuestion: View {
    @State var text = ""
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 274, height: 340)
                .foregroundColor(.green200)
            
            VStack (alignment: .center, spacing: 100){
                Text("Un petit nom pour cet évènement?")
                    .multilineTextAlignment(.center)
                TextField("Nom", text: $text)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(20)
                    .multilineTextAlignment(.center)
            }.padding(.horizontal, 30)
            
            
        }.frame(width: 274, height: 340)
    }
}

#Preview {
    NameEventQuestion()
}
