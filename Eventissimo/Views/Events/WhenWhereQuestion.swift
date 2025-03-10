//
//  WhenWhereQuestion.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 07/03/2025.
//

import SwiftUI

struct WhenWhereQuestion: View {
    @State var EventselectedDate: Date = Date()
    @State var text = ""
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 274, height: 340)
                .foregroundColor(.green200)
            
            VStack (alignment: .center, spacing: 40){
                Text("On se retrouve où?")
                    .multilineTextAlignment(.center)
                TextField("Lieu", text: $text)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(20)
                    .multilineTextAlignment(.center)
                Text("Et quand?")
                    .multilineTextAlignment(.center)
                DatePicker("",
                            selection: $EventselectedDate,
                            displayedComponents: [.date, .hourAndMinute]
                 )
                 .datePickerStyle(.compact)
                 .labelsHidden()
                 .padding(10)
                 .background(Color.white)
                 .cornerRadius(20)
                
            }.padding(.horizontal, 25)
            
            
            
        }.frame(width: 274, height: 340)

    }
}

#Preview {
    WhenWhereQuestion()
}
