//
//  CreateNewTaskExtracted.swift
//  Eventissimo
//
//  Created by apprenant104 on 18/03/2025.
//

import SwiftUI

struct CreateNewTaskExtracted: View {
    @State var newTask : TaskApp = TaskApp(title: "",isUrgent: false, personsAssigned: [])
    func addNewTask(newTask : TaskApp){
        
        event.tasks.append(newTask)
    }
    @Binding var dataBase: DataBase
    @Binding var event: EventApp
    
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.darkblue200)
                    .frame(height: 50)
                    .opacity(0.4)
                
                VStack(spacing: 8) {
                    TextField("Saisir la Nouvelle Tâche", text: $newTask.title)
                        .padding()
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(12)
                    .foregroundColor(.darkblue700)}
            }
            
            Button {
                newTask.isUrgent.toggle()
            } label: {
                
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(newTask.isUrgent ? .greenGray:.green500.mix(with: .gray, by: 0.25))
                            .frame(width: 24, height: 24)
                            .cornerRadius(6)
                        Rectangle()
                            .fill(newTask.isUrgent ? .green700.mix(with: .black, by: 0.1) : .darkblue50)                                    .frame(width: 22,height: 22)
                            .cornerRadius(5)
                        if newTask.isUrgent{
                            Image(systemName: "checkmark")
                                .font(.system(size: 10))
                                .foregroundStyle(.white)
                                .transition(.scale)
                            
                        }
                        
                    }
                    .padding(.leading,12)
                    
                    Text("Cette tâche est-elle urgente?")
                        .jakarta(size: 12)
                        .foregroundStyle(.darkblue700)
                    
                }
            }

       
            
            Button {
                // Ajoute une task dans le tableau des tasks :
                if !newTask.title.isEmpty {
    //                event.tasks.append(newTask)
                    event.tasks.append(newTask)
                    // Réinitialise le champ TextField après l'ajout :
                    newTask = TaskApp(title: "", personsAssigned: [])
                }
            } label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.green700)
                        .frame(height: 48)
                    Text("Ajouter une tâche")
                        .jakarta(size: 16)
                        .foregroundColor(.darkblue50)
                }
            }
            
            Button {
                // permet d'ajouter une tâche
                addNewTask(newTask: TaskApp(title: "hello", personsAssigned: [dataBase.currentUser]))
            } label: {
                // prendre le bouton d'Alex sur la partie créer un event ou celui de Lucie sur le profil je crois
                
                // OU permetre d'ajouter une tâche en touchant en dessous de la dernière tâche affichée
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.green700)
                        .frame(width: 200,height: 32)
                    Text("Valider")
                        .foregroundStyle(.darkblue50)
                        .jakarta(size: 16)
                }
            }
        }
      
        
    }
}

#Preview {
    CreateNewTaskExtracted(dataBase: Binding.constant(DataBase()), event: Binding.constant(events[0]))
}
