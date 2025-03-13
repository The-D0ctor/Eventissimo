//
//  TaskExtractedView.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import SwiftUI

struct PersonalTasksListView: View {
@State var tasksList: [TaskApp]
    @StateObject var viewModel = TaskViewModel()
    var body: some View {
        
        ForEach($tasksList) { $taskApp in
            HStack {
                // faire en sorte que mon bouton retienne son Bool
                // mettre en place un SwiftData pour sauvegarder les tâches réalisées
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
                    Text(taskApp.title)
                        .strikethrough(taskApp.isCompleted)
                        .foregroundStyle(taskApp.isCompleted ? .white:.darkblue900)
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
                    isUrgentExtracted()
                }
            }
            .padding(12)
            .background(taskApp.isCompleted ? .green500: .green200.mix(with: .white, by: 0.25))
            .cornerRadius(11)
            .overlay(
                RoundedRectangle(cornerRadius: 11)
                    .stroke(taskApp.isCompleted ? .green500.mix(with: .black, by: 0.1) : .green200.mix(with: .gray, by: 0.3), lineWidth: 1)
            )
        }
        
    }
}

#Preview {
    PersonalTasksListView(tasksList: events[0].tasks)
}
