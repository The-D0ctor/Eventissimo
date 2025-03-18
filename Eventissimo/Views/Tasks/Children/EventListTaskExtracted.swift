//
//  EventListTaskExtracted.swift
//  Eventissimo
//
//  Created by apprenant104 on 12/03/2025.
//

import SwiftUI

struct EventListTaskExtracted: View {
    //@State var viewModel = TaskViewModel()
    @Binding var tasksList: [TaskApp]
    
    var body: some View {
        
        ForEach($tasksList) { $taskApp in
            VStack(alignment: .leading){
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(taskApp.isCompleted ? .green700.mix(with: .black, by: 0.1) : .clear)
                    //                        .stroke(lineWidth: 0.8)
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
                                    withAnimation(.easeIn(duration: 0.4), {
                                        taskApp.showModifiers.toggle()
                                    })
                                    
                                } label: {
                                    VStack(alignment: .leading){
                                        
                                        Text(taskApp.title)
                                            .strikethrough(taskApp.isCompleted)
                                            .foregroundStyle(taskApp.isCompleted ? .darkblue50:.darkblue900)
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
                                        isUrgentExtracted(urgentColor: .green700)
                                    }
                                }
                                
                                Spacer()
                                
                                
                                if taskApp.showModifiers {
                                    if !taskApp.isCompleted{
                                        Button (role: .destructive){
                                            // va pouvoir supprimer une tâche
                                        } label: {
                                            Image("crossDelete")
                                                .resizable()
                                                .frame(width:16, height: 16)
                                        }
                                        
                                        Button{
                                            // va pouvoir modifier la tâche et sa description ainsi que les personnes assignées
                                        } label: {
                                            Image(systemName: "pencil.line")
                                                .font(.system(size: 16))
                                                .foregroundStyle(.green700)
                                        }
                                        .padding(.trailing,16)
                                    }
                                    else{
                                        Button (role: .destructive){
                                            // va pouvoir supprimer une tâche
                                            
                                        } label: {
                                            Image("crossDelete")
                                                .resizable()
                                                .frame(width:16, height: 16)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(10)
                        
                        Spacer()
                    }
                    
                }
                
            }
            .animation(nil, value: taskApp.isCompleted)
            Divider()
                .frame(width: 290, alignment: .trailing)
                .background(.green500)
            
        }
        .padding([.top,.bottom],4)
    }
}

#Preview {
    EventListTaskExtracted(tasksList: Binding.constant(events[0].tasks))
}
