//
//  EventQuestionCard.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 07/03/2025.
//

import SwiftUI

struct NameEventQuestion: View {
    @State var nameEvent = ""
    @Binding var selectedTab: Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 274, height: 400)
                .foregroundColor(.green200)
            
            VStack (alignment: .center, spacing: 100){
                Text("Un petit nom pour cet évènement?")
                    .jakarta(size: 18)
                    .multilineTextAlignment(.center)
                TextField("Nom", text: $nameEvent)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(20)
                    .multilineTextAlignment(.center)
                Button {
                    withAnimation {
                        selectedTab += 1
                    }
                    
                    
                } label : {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(15)
                        .background(Color.darkblue700)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                        
                    
                }
            }.padding(.horizontal, 30)
            
            
        }.frame(width: 274, height: 340)
        
        
    }
}

#Preview {
    NameEventQuestion(selectedTab: .constant(0))
}
