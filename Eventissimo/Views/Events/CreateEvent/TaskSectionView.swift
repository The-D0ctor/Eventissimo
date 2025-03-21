//
//  TaskSectionView.swift
//  Eventissimo
//
//  Created by Maxime Point on 13/03/2025.
//


import SwiftUI

struct TaskSectionView: View {
    
    @Binding var event: EventApp
    @State var newTask = TaskApp(title: "", personsAssigned: [])
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Divider()
            
            Text("Tâches à faire")
                .serif(size: 20)
                .foregroundStyle(.darkblue700)
            
            // Ajoute la task sur la view :
            if !event.tasks.isEmpty{
                VStack {
                    ForEach($event.tasks) { $task in
                        HStack(alignment: .center){
                            Text(task.title)
                                .foregroundStyle(.darkblue700)
                                .jakarta(size: 14)
                            Spacer()
                            Button {
                                // remove la task
                                if let index = event.tasks.firstIndex(where: { $0.id == task.id }) {
                                    event.tasks.remove(at: index)
                                }
                            } label: {
                                Image("crossDelete")
                            }
                        }
                        .frame(height: 24)
                        .padding(.bottom, 8)
                    }
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.darkblue200)
                    .frame(height: 120)
                    .opacity(0.4)
                
                VStack(spacing: 8) {
                    TextField("Nom de la tâche", text: $newTask.title)
                        .padding()
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(12)
                        .foregroundColor(.darkblue700)
                    Button {
                        // Ajoute une task dans le tableau des tasks :
                        if !newTask.title.isEmpty {
                            event.tasks.append(newTask)
                            // Réinitialise le champ TextField après l'ajout :
                            newTask = TaskApp(title: "", personsAssigned: [])
                        }
                    } label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.green650)
                                .frame(height: 48)
                            Text("Ajouter une tâche")
                                .jakarta(size: 16)
                                .fontWeight(.medium)
                                .foregroundColor(.green650)
                        }
                    }
                }
                .padding(8)
            }
            
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

#Preview {
    TaskSectionView(event: .constant(events[0]))
        .background(.darkblue50)
}
