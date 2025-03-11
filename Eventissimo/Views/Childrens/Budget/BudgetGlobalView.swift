//
//  BudgetGlobalView.swift
//  Eventissimo
//
//  Created by apprenant103 on 07/03/2025.
//

import SwiftUI
import Charts

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
                        .foregroundStyle(.redCategoryBudget)
                    Rectangle()
                        .foregroundStyle(.green500)
                        .frame(width: geometry.size.width * 0.2)
                    
                    Rectangle()
                        .foregroundStyle(.purpleCategoryBudget)
                        .frame(width: geometry.size.width * 0.4)
                }
                
            }
            
            .frame(width: .infinity, height: 30)
            .clipShape(.rect(cornerRadius: 50))
//            Chart(events[1].budget.spendings) { item in
//                            BarMark(
//                                x: .value("% ", item.role.rawValue)
//                                
//                            )
//                            
//                        }
//                        .chartXAxis {
//                            AxisMarks(values: .automatic(desiredCount: 0))
//                        }
//                        .clipShape(RoundedRectangle(cornerRadius: 3))
            
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
            .foregroundStyle(Color.darkblue700)
            
            
            HStack{
                Circle()
                    .foregroundStyle(sprendingsAnnivMarion[2].role.color)
                    .frame(width: 14, height: 14)
                Text(sprendingsAnnivMarion[2].role.rawValue)
                    .jakarta(size: 16)
                
                Spacer()
                
            Text("\(sprendingsAnnivMarion[2].amount) €")
            }
            
            HStack{
                Circle()
                    .foregroundStyle(sprendingsAnnivMarion[0].role.color)
                    .frame(width: 14, height: 14)
                Text(sprendingsAnnivMarion[0].role.rawValue)
                    .jakarta(size: 16)
                
                Spacer()
                
            Text("\(sprendingsAnnivMarion[0].amount) €")
            }

            
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
        VStack{
            HStack{
            Text("Alimentation")
                    .jakarta(size: 16)
                
                Spacer()
                
                Text("100 €")
            }
            .padding()
            .background(Color.green500)
            
            VStack{
                HStack{
                    Image(jules.profilePicture ?? "marionProfilPicture")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 52, height: 52)
                        .clipped()
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading){
                        Text(jules.name)
                            .jakarta(size: 16)
                            
                        Text(sprendingsAnnivMarion[1].descriptionSpend ?? "")
                            .jakarta(size: 14)
                            .foregroundStyle(.darkblue400)
                    }
                    Spacer()
                    Text("15 €")
                }
                
                Divider()
                    .padding(.vertical, 5)
                
                HStack{
                    Image(jules.profilePicture ?? "marionProfilPicture")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 52, height: 52)
                        .clipped()
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading){
                        Text(jules.name)
                            .jakarta(size: 16)
                            
                        Text(sprendingsAnnivMarion[1].descriptionSpend ?? "")
                            .jakarta(size: 14)
                            .foregroundStyle(.darkblue400)
                    }
                    Spacer()
                    Text("15 €")
                }
            }
            .padding()
            
        }
        
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundStyle(.darkblue700)
        
    }
}

#Preview {
    BudgetGlobalView()
}
