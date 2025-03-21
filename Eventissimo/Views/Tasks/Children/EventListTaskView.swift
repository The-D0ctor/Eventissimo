//
//  EventListTasksView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct EventListTaskView: View {
    @State var showCreateNewTask: Bool = false
    @Binding var dataBase: DataBase
    @Binding var event: EventApp
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ZStack {
            Color.darkblue50
                .ignoresSafeArea()
            VStack{
                Text(event.name)
                    .serif(size: 20)
                    .foregroundStyle(.darkblue900)
                
                
                
                ScrollView {
                    
                    EventListTaskExtracted(tasksList:$event.tasks)
                    
                    
                    Button {
                        showCreateNewTask.toggle()
                    } label: {
                        VStack{
                            
                            Text("Ajouter \n une nouvelle tâche")
                                .jakarta(size: 16)
                                .foregroundStyle(.darkblue400)
                                .padding(.top,24)
                            Image("plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(10)
                                .background(.green650)
                                .clipShape(Circle())
                                .foregroundStyle(.white)
                                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
                        }
                    }
                    
                    // 2. modale avec des textField pour ajouter de la data dans mon tableau de données
                    .sheet(isPresented: $showCreateNewTask) {
                        CreateNewTaskExtracted(dataBase: $dataBase, event: $event)
                    }
                }
            }
            .padding([.leading,.trailing],12)
            .padding(.top,42)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                }
            }
        }
    }
}


#Preview {
    EventListTaskView(dataBase: Binding.constant(DataBase()), event: Binding.constant(events[0]))
}
