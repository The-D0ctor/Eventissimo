//
//  TaskExtractedView.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import SwiftUI

struct PersonalTasksListView: View {
    @Binding var tasksList: [TaskApp]
    var body: some View {
        
        ForEach($tasksList) { $taskApp in
            HStack {
                Button {
                    withAnimation(.easeIn(duration: 0.25)) {
                            taskApp.isCompleted.toggle()
                        }
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(taskApp.isCompleted ? .greenGray:.green500.mix(with: .gray, by: 0.25))
                            .frame(width: 30, height: 30)
                            .cornerRadius(6)
                        Rectangle()
                            .fill(taskApp.isCompleted ? .green700.mix(with: .black, by: 0.1) : .white)                                    .frame(width: 28,height: 28)
                            .cornerRadius(5)
                        if taskApp.isCompleted{
                            Image(systemName: "checkmark")
                                .foregroundStyle(.white)
                                .transition(.scale)
                            
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(taskApp.title)
                        .strikethrough(taskApp.isCompleted)
                        .foregroundStyle(taskApp.isCompleted ? .green900:.darkblue900)
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
                
                if taskApp.isUrgent{
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundStyle(taskApp.isCompleted ? .white.opacity(0.7) : .red.mix(with: .gray, by: 0.25))
                        
                        Text("Urgent")
                            .jakarta(size: 10)
                            .foregroundStyle(taskApp.isCompleted ? .white.opacity(0.7) : .red.mix(with: .gray, by: 0.25))
                        
                    }
                }
            }
            .padding(12)
            .background(taskApp.isCompleted ? .green400.mix(with: .black, by: 0.1) : .darkblue50)
            .cornerRadius(11)
            .overlay(
                RoundedRectangle(cornerRadius: 11)
                    .stroke(taskApp.isCompleted ? .green500.mix(with: .black, by: 0.1) : .green200.mix(with: .gray, by: 0.3), lineWidth: 1)
            )
        }
        
    }
}

#Preview {
    PersonalTasksListView(tasksList: Binding.constant(events[0].tasks))
}
