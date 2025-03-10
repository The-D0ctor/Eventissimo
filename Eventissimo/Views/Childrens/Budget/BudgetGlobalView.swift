//
//  BudgetGlobalView.swift
//  Eventissimo
//
//  Created by apprenant103 on 07/03/2025.
//

import SwiftUI

struct BudgetGlobalView: View {
    var body: some View {
        VStack{
            GeometryReader { geometry in
                ZStack{
                    Color.darkblue200.opacity(0.4)
                }
                HStack(spacing:0){
                    Rectangle()
                        .frame(width: geometry.size.width * 0.3)
                        .foregroundStyle(.black)
                    Rectangle()
                        .foregroundStyle(.green500)
                        .frame(width: geometry.size.width * 0.2)
                    
                    Rectangle()
                        .foregroundStyle(.red)
                        .frame(width: geometry.size.width * 0.4)
                }
                
            }
            
            .frame(width: .infinity, height: 30)
            .clipShape(.rect(cornerRadius: 50))
            
            
            HStack{
                VStack{
                    Text("Total")
                        .jakarta(size: 14)
                        .bold()
                        .padding(.bottom, 4)
                    Text("1 000 €")
                        .jakarta(size: 14)
                }
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green500, lineWidth: 2)
                )
                
                Spacer()
                VStack{
                    Text("Dépensé")
                        .jakarta(size: 14)
                        .bold()
                        .padding(.bottom, 4)
                    Text("400 €")
                        .jakarta(size: 14)
                }
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green500, lineWidth: 2)
                )
                
                Spacer()
                VStack{
                    Text("Restant")
                        .jakarta(size: 14)
                        .bold()
                        .padding(.bottom, 4)
                    Text("600 €")
                        .jakarta(size: 14)
                }
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green500, lineWidth: 2)
                )
                
            }
            .padding()
            
            
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    BudgetGlobalView()
}
