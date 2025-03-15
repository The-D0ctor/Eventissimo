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
        
        ForEach($tasksList, id: \.id) { $taskApp in
            VStack(alignment: .leading){
                HStack{
                    Button {
                        taskApp.isCompleted.toggle()
                    } label: {
                        
                        ZStack {
                            Rectangle()
                                .fill(taskApp.isCompleted ? .green700.mix(with: .black, by: 0.1):.green500.mix(with: .gray, by: 0.25))
                                .frame(width: 30, height: 30)
                                .cornerRadius(6)
                            Rectangle()
                                .fill(taskApp.isCompleted ? .green700.mix(with: .blue, by: 0.1) : .white)                                    .frame(width: 28,height: 28)
                                .cornerRadius(5)
                            if taskApp.isCompleted{
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                
                            }
                        }
                        
                    }
                    VStack(alignment: .leading) {
                        HStack{
                            VStack{
                                Text(taskApp.title)
                                    .strikethrough(taskApp.isCompleted)
                                    .foregroundStyle(taskApp.isCompleted ? .green700:.darkblue900)
                                    .jakarta(size: 12)
                                    .lineLimit(1)
                                
                                
                                if (taskApp.description != nil) {
                                    Text(taskApp.description ?? "")
                                        .jakarta(size: 10)
                                        .foregroundStyle(.gray.mix(with: .darkblue900, by: 0.4))
                                        .lineLimit(1)
                                    
                                }
                            }
                            Spacer()
                            ForEach(taskApp.personsAssigned) { person in
                                if let profilePicture = person.profilePicture {
                                    Image(profilePicture)
                                        .resizable()
                                        .frame(height: 24)
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        Divider()
                            .frame(width: 330,alignment: .trailing)
                            .background(.green500)
                    }
                    .padding(10)
                    Spacer()
                    
                   
                }
            }
        }
    }
}

#Preview {
    EventListTaskExtracted(tasksList: Binding.constant(events[0].tasks))
}
