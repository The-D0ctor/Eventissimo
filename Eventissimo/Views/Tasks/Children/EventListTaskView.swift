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
    
    var body: some View {
        ZStack {
            Color.darkblue50
                .ignoresSafeArea()
            VStack{
                Text(event.name)
                    .serif(size: 24)
                    .foregroundStyle(.darkblue900)
                ScrollView {
                    
                    EventListTaskExtracted(tasksList:$event.tasks)
                    
                    // 1. nouveau bouton pour afficher la modale -> toggle
                    
                    Button {
                        showCreateNewTask.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green700)
                                .frame(width:300 ,height: 32)
                            Text("Ajouter une nouvelle Tâche")
                                .jakarta(size: 16)
                                .foregroundColor(.darkblue50)
                        }
                        .padding(.top,24)
                        
                    }
                    
                    // 2. modale avec des textField pour ajouter de la data dans mon tableau de données
                    .sheet(isPresented: $showCreateNewTask) {
                        
                        CreateNewTaskExtracted(dataBase: $dataBase, event: $event)
                            .presentationDetents([.height(350)])

                    }

                    }
                    
                    // 3. ⬇️ on trouvera le bouton dans la modale sous forme de bouton "valider" pour confirmer les données via ma fonction addNewTask
                    
//                    Button {
//                        // permet d'ajouter une tâche
//                        addNewTask(newTask: TaskApp(title: "hello", personsAssigned: [dataBase.currentUser]))
//                    } label: {
//                        // prendre le bouton d'Alex sur la partie créer un event ou celui de Lucie sur le profil je crois
//
//                        // OU permetre d'ajouter une tâche en touchant en dessous de la dernière tâche affichée
//                        Rectangle()
//                            .fill(.green700)
//                    }
                    
                    
                    
                }
                .padding([.leading,.trailing],12)
                .padding(.top,42)
            }
        }
    }


#Preview {
    EventListTaskView(dataBase: Binding.constant(DataBase()), event: Binding.constant(events[0]))
}
