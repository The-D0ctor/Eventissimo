//
//  CreateNewTaskExtracted.swift
//  Eventissimo
//
//  Created by apprenant104 on 18/03/2025.
//

import SwiftUI

struct CreateNewTaskExtracted: View {
    @State var newTask : TaskApp = TaskApp(title: "", description: nil, isUrgent: false, personsAssigned: [])
    func addNewTask(newTask : TaskApp){
        
        event.tasks.append(newTask)
    }
    @Binding var dataBase: DataBase
    @Binding var event: EventApp
    @Environment(\.dismiss) var dismiss
    @State var showList : Bool = false
    @State var guests: [Person] = []
    @State var searchPerson = ""
    @State var isSelected : Bool = false
    
    
    var body: some View {
        ZStack {
            Color.darkblue50
                .ignoresSafeArea()
            VStack{
                HStack{
                    Button {
                        //
                    } label: {
                        Text("Fermer")
                            .jakarta(size: 12)
                            .tint(.redCategoryBudget)
                    }
                    .opacity(0)
                    
                    Spacer()
                    
                    Text("Créer une nouvelle tâche")
                        .serif(size: 24)
                        .foregroundStyle(.darkblue700)
                        .padding([.top,.bottom],16)
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Fermer")
                            .jakarta(size: 12)
                            .tint(.redCategoryBudget)
                    }
                    .padding(.trailing,16)
                }
                
                
                ScrollView {
                    VStack(alignment: .leading){
                        
                        
                        
                        VStack(alignment: .leading, spacing: 5){
                            
                            Text("Nouvelle tâche")
                                .jakarta(size: 14)
                                .foregroundStyle(.darkblue700)
                            
                            TextField("Que reste-t-il à faire ?", text: $newTask.title)
                                .font(.system(size: 14))
                                .padding()
                                .background(.darkblue200.opacity(0.2))
                                .frame(width: 354, height: 40)
                                .cornerRadius(8)
                        }
                        .padding(.bottom,16)
                        
                        
                        
                        
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
                                        .fill(newTask.isUrgent ? .green700 : .darkblue50)                                    .frame(width: 22,height: 22)
                                        .cornerRadius(5)
                                    if newTask.isUrgent{
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 10))
                                            .foregroundStyle(.white)
                                            .transition(.scale)
                                        
                                    }
                                    
                                }
                                .padding(.leading,12)
                                
                                Text("Cette tâche est urgente !")
                                    .jakarta(size: 12)
                                    .foregroundStyle(.darkblue700)
                                    .padding([.top,.bottom],16)
                            }
                        }
                        .padding(.bottom,16)
                        
                        VStack(alignment: .center){
                            if newTask.personsAssigned != []{
                                HStack{
                                    ForEach(newTask.personsAssigned) { person in
                                        if let profilePicture = person.profilePicture {
                                            ScrollView {
                                                profilePicture
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 24, height: 24)
                                                    .clipShape(Circle())
                                                    .overlay(Circle().stroke(Color.darkblue50, lineWidth: 2))
                                                Text(person.name)
                                                    .jakarta(size: 10)
                                                    .foregroundStyle(.darkblue700)
                                            }
                                            
                                        }
                                    }
                                }
                                
                                
                                
                                
                                
                                
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("Besoin d'aide ?")
                                .jakarta(size: 14)
                                .foregroundStyle(.darkblue700)
                            
                            TextField("Proposer à des amis", text: $searchPerson)
                                .font(.system(size: 14))
                                .padding()
                                .background(.darkblue200.opacity(0.2))
                                .frame(width: 354, height: 40)
                                .cornerRadius(8)
                        }
                        
                        VStack{
                            
                            // 1. mettre en place un filtre user qui filtre les participants de l'évènements
                            if !searchPerson.isEmpty && event.participants.filter({ users in
                                users.person.name.lowercased().contains(searchPerson.lowercased())
                            }).isEmpty == false {
                                
                                
                                VStack{
                                    
                                    //2. appliquer le même filre qu'en haut pour mon ForEach de choix de possibilités
                                    ForEach(event.participants.filter { users in
                                        users.person.name.lowercased().contains(searchPerson.lowercased()) &&
                                        !newTask.personsAssigned.contains(where: { $0.id == users.person.id }) // Empêche les doublons
                                    }) { newInvite in
                                        
                                        
                                        Button(action:{
                                            let newParticipant = newInvite
                                            newTask.personsAssigned.append(newParticipant.person)
                                            searchPerson = ""
                                            
                                        }, label: {
                                            VStack{
                                                HStack{
                                                    (newInvite.person.profilePicture ?? Image(""))
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 40, height: 40)
                                                        .clipShape(.circle)
                                                    
                                                    Text(newInvite.person.name)
                                                        .jakarta(size: 14)
                                                        .foregroundStyle(.darkblue700)
                                                    Spacer()
                                                    
                                                    
                                                }
                                                Divider()
                                            }
                                        })
                                        .simultaneousGesture(TapGesture().onEnded{
                                            isSelected.toggle()
                                        }
                                        )
                                    }
                                }
                                .padding()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                            }
                        }
                        
                        
                        
                        Button {
                            // Ajoute une task dans le tableau des tasks :
                            if !newTask.title.isEmpty {
                                //                event.tasks.append(newTask)
                                event.tasks.append(newTask)
                                if let taskDescription = newTask.description{
                                    event.description.append(taskDescription)
                                }
                                
                                // Réinitialise le champ TextField après l'ajout :
                                newTask = TaskApp(title: "", personsAssigned: [])
                            }
                        } label:{
                            ZStack{
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.green700)
                                    .frame(height: 48)
                                Text("Ajouter une tâche")
                                    .jakarta(size: 14)
                                    .fontWeight(.medium)      .foregroundColor(.darkblue50)
                            }
                            .padding(.top,20)
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            dismiss()
                        }
                        )
                    }
                    .padding(20)
                }
                
            }
            
        }
        
        
        
        
        
    }
}

#Preview {
    CreateNewTaskExtracted(dataBase: Binding.constant(DataBase()), event: Binding.constant(events[0]))
}
