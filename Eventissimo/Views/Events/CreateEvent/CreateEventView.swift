//
//  CreateEventView.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 11/03/2025.
//

import SwiftUI

struct CreateEventView: View {
    @Environment(\.dismiss) var dismiss
    
    var dataBase: DataBase
    
    @State var event = EventApp(name: "", description: "", date: Date.now, localization: "", participants: [Participant(person: marion, role: .organizer)], nonParticipants: [], image: nil, tasks: [], budget: Budget(totalBudget: 0, spendings: []), eventMessages: [])
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.darkblue50.ignoresSafeArea()
                
                VStack {
                    
                    ScrollView {
                        VStack(alignment : .center) {
                            AddPhotoButtonView(event: $event)
                            
                            //MARK: - Information générales
                            InformationsSectionView(event: $event)
                            
                            //MARK: - Taches à faire
                            TaskSectionView(event: $event)
                            
                            //MARK: - Invitation
                            ParticipantsSectionView(event: $event)
                            
                            // MARK: - Save button
                            
                            // TODO: rendre fonctionnel le bouton
                            Button {
//                                event.participants.append(Participant(person: dataBase.currentUser, role: .organizer))
                                dataBase.events.insert(event, at: 0)
                                dismiss()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.green700)
                                        .frame(height: 48)
                                    Text("Créer l'évènement")
                                        .jakarta(size: 16)
                                        .fontWeight(.medium)
                                        .foregroundColor(.darkblue50)
                                }
                                .padding()
                            }.disabled(event.name.isEmpty || event.description.isEmpty || event.localization.isEmpty || event.image == nil)
                        }
                    }
                    .scrollIndicators(.hidden)
                }.padding()
            }
            
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
                    Text("Créer un évènement")
                        .serif(size: 20)
                        .fontWeight(.medium)
                        .padding(.leading, 20)
                    
                }
                .foregroundColor(.darkblue900)
            }
           
        }
    }
}

#Preview {
    CreateEventView(dataBase: DataBase())
}



// padding entre Date || Heure et leurs textfields, ça vient d'où?
// mettre le text indicator des textfields de la même couleur que celui du textEditor ou inversement

// problème pour modifier le picker


