//
//  myListTask.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import SwiftUI

struct MyListTaskView: View {
    @Environment(DataBase.self) var dataBase
    
    var body: some View {
        @Bindable var viewModel: TaskViewModel = TaskViewModel(dataBase: dataBase)
        
        NavigationStack{
            ZStack {
                Color.darkblue50
                    .ignoresSafeArea()
                
                VStack{
                    Text("Liste de mes Tâches")
                        .serif(size: 24)
                        .foregroundStyle(.darkblue900)
                    
                    ScrollView {
                        ForEach($viewModel.dataBase.myEvents) { $event in
                            PersonalEventTasksCardView(dataBase: $viewModel.dataBase, event: $event, tasksList: viewModel.getUserEventTasks(event: event))
                                .padding(.bottom)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    MyListTaskView()
        .environment(DataBase())
}

