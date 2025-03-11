//
//  WhenWhereQuestion.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 07/03/2025.
//

import SwiftUI

struct WhenWhereQuestion: View {
    @State var EventselectedDate: Date = Date()
    @State var localization = ""
    @Binding var selectedTab: Int

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 274, height: 400)
                .foregroundColor(.green200)
            
            VStack (alignment: .center, spacing: 40){
                Text("On se retrouve où?")
                    .jakarta(size: 18)
                    .multilineTextAlignment(.center)
                TextField("Lieu", text: $localization)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(20)
                    .multilineTextAlignment(.center)
                Text("Et quand?")
                    .jakarta(size: 18)
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
                HStack {
                    Button {
                        withAnimation {
                            selectedTab -= 1
                        }
                        
                        
                    } label : {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(15)
                            .background(Color.darkblue700)
                            .clipShape(Circle())
                            .foregroundStyle(.white)
                    
                        
                        
                    }
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
                }
                
            }.padding(.horizontal, 25)
            
            
            
            
        }.frame(width: 274, height: 340)

    }
}

#Preview {
    WhenWhereQuestion(selectedTab: .constant(0))
}
