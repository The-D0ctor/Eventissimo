//
//  myListTask.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import SwiftUI

struct MyListTaskView: View {
    @StateObject var viewModel = TaskViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                Color.darkblue50
                    .ignoresSafeArea()
                
                VStack{
                    Text("Liste de mes Tâches")
                        .serif(size: 24)
                        .foregroundStyle(.darkblue900)
                    // .padding(.top)
                    
                    ScrollView {
                        ForEach(viewModel.myEvents) { event in
                            PersonalEventTasksCardView(event: event, tasksList: viewModel.getUserEventTasks(event: event))
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
}

