//
//  TaskExtractedView.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import SwiftUI

struct TaskExtractedView: View {
    @StateObject var viewModel = TaskViewModel()
    var body: some View {
        ForEach($viewModel.myTasks) { $taskApp in
            
            VStack{
                ZStack {
                    Rectangle()
                        .frame(width: 302,height: 52)
                        .foregroundStyle(taskApp.isCompleted ? .green500.mix(with: .black, by: 0.1):.green200.mix(with: .gray, by: 0.3))
                        .cornerRadius(11)
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundStyle(taskApp.isCompleted ? .green500: .green200.mix(with: .white, by: 0.25))
                        .cornerRadius(10)
                    
                    //mettre un if let pour isUrgent?
                    isUrgentExtracted()
                        .offset(x:100)
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
                        
                        VStack{
                            Text(taskApp.title)
                                .strikethrough(taskApp.isCompleted)
                                .foregroundStyle(taskApp.isCompleted ? .white:.darkblue900)
                                .font(.system(size: 12))
                                .frame(width: 220,alignment: .leading)
                                .lineLimit(1)
                            
                            //mettre en place un if let pour uen description en String?
//                            if let descriptionText = viewModel.myTasks.description {
//                                Text(descriptionText)
//                                    .font(.caption2)
//                                
//                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TaskExtractedView()
}
