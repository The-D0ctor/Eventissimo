//
//  EventListTaskExtracted.swift
//  Eventissimo
//
//  Created by apprenant104 on 12/03/2025.
//

import SwiftUI

struct EventListTaskExtracted: View {
    @Binding var tasksList: [TaskApp]
    
    
    var body: some View {
        
        ForEach($tasksList) { $taskApp in
            VStack(alignment: .leading){
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(taskApp.isCompleted ? .green400.mix(with: .black, by: 0.1) : .white)
                        .foregroundStyle(.green700.mix(with: .white, by: 0.5))
                        .frame(height: 70)
                    
                    HStack{
                        Button {
                            withAnimation(.easeIn(duration: 0.25)) {
                                taskApp.isCompleted.toggle()
                            }
                        } label: {
                            
                            ZStack {
                                Rectangle()
                                    .fill(taskApp.isCompleted ? .greenGray:.green500.mix(with: .gray, by: 0.25))
                                    .frame(width: 24, height: 24)
                                    .cornerRadius(6)
                                Rectangle()
                                    .fill(taskApp.isCompleted ? .green700.mix(with: .black, by: 0.1) : .darkblue50)                                    .frame(width: 22,height: 22)
                                    .cornerRadius(5)
                                if taskApp.isCompleted{
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.white)
                                        .transition(.scale)
                                    
                                }
                                
                            }
                            .padding(.leading,12)
                            
                        }
                        
                        VStack(alignment: .leading) {
                            HStack{
                                Button {
                                    withAnimation(.easeIn(duration: 1), {
                                        taskApp.showModifiers.toggle()
                                    })
                                    
                                } label: {
                                    VStack(alignment: .leading){
                                        
                                        Text(taskApp.title)
                                            .strikethrough(taskApp.isCompleted)
                                            .foregroundStyle(taskApp.isCompleted ? .green900:.darkblue900)
                                            .jakarta(size:12)
                                            .lineLimit(1)
                                        if (taskApp.description != nil) {
                                            Text(taskApp.description ?? "")
                                                .jakarta(size: 10)
                                                .foregroundStyle(.gray.mix(with: .darkblue900, by: 0.4))
                                                .lineLimit(1)
                                            
                                        }
                                        
                                        HStack(spacing: -5) {
                                            ForEach(taskApp.personsAssigned) { person in
                                                if let profilePicture = person.profilePicture {
                                                    profilePicture
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 24, height: 24)
                                                        .clipShape(Circle())
                                                        .overlay(Circle().stroke(Color.darkblue50, lineWidth: 2))
                                                }
                                            }
                                        }
                                        
                                        
                                    }
                                    Spacer()
                                    
                                    if taskApp.isUrgent{
                                        VStack {
                                            Image(systemName: "exclamationmark.triangle")
                                                .foregroundStyle(taskApp.isCompleted ? .white.opacity(0.7) : .red.mix(with: .gray, by: 0.25))
                                            
                                            Text("Urgent")
                                                .jakarta(size: 10)
                                                .foregroundStyle(taskApp.isCompleted ? .white.opacity(0.7) : .red.mix(with: .gray, by: 0.25))
                                            
                                            
                                        }
                                        .padding(.trailing,8)
                                        .transition(.slide)

                                    }
                                }
//                                .transition(.slide)

                                .animation(.easeInOut(duration: 0.5), value: taskApp.showModifiers)
                                
                                
                                
                                if taskApp.showModifiers {
                                    Button {
                                        // va pouvoir supprimer une tâche
                                            if tasksList.contains(taskApp){
                                                tasksList.removeAll { guest in
                                                    guest.id == taskApp.id
                                                }
                                                
                                            }
                                            
                                        
                                        
                                    } label: {
                                        Image("crossDelete")
                                            .resizable()
                                            .frame(width:20, height: 20)
                                            .transition(.opacity)

                                    }
                                    .transition(.slide)

                                    
                                }
                            }
                        }
                        .padding(10)
                        
                        Spacer()
                    }
                    
                }
                
            }
            //            .animation(.easeIn, value: taskApp.isCompleted)
            Divider()
                .frame(width: 290, alignment: .trailing)
                .background(.green500)
            
        }
        .padding([.top,.bottom],2)
    }
}


#Preview {
    EventListTaskExtracted(tasksList: Binding.constant(events[0].tasks))
}
