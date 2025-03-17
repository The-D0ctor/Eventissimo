//
//  EventListTasksView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct EventListTaskView: View {
    @Binding var dataBase: DataBase
    
    @Binding var currentIndex : Int
    var body: some View {
            ZStack {
                Color.darkblue50
                    .ignoresSafeArea()
                VStack{
                    Text(dataBase.events[currentIndex].name)
                        .serif(size: 24)
                        .foregroundStyle(.darkblue900)
                    ScrollView {
                        
                        EventListTaskExtracted(tasksList:$dataBase.events[currentIndex].tasks)
                        
                        Button {
                            // permet d'ajouter une tâche
                        } label: {
                            // prendre le bouton d'Alex sur la partie créer un event ou celui de Lucie sur le profil je crois
                            
                            // OU permetre d'ajouter une tâche en touchant en dessous de la dernière tâche affichée
                            
                            Rectangle()
                                .frame(width: 350)
                        }

                    }
                    .padding([.leading,.trailing],24)
                    .padding(.top,42)
                }
            }
//            .navigationTitle(Text(event.name))
        
     
    }
}

#Preview {
    EventListTaskView(dataBase: Binding.constant(DataBase()), currentIndex: .constant(2))
}
