//
//  CreateEventView.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 11/03/2025.
//

import SwiftUI

struct CreateEventView: View {
    
    @State var event = Event(name: "", description: "", date: Date.now, localization: "", participants: [], guests: [], image: "", tasks: [], budget: Budget(totalBudget: 0, spendings: []), eventMessages: [])
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkblue50.ignoresSafeArea()
                
                VStack {
                    
                    Text("Créer un évènement")
                        .serif(size: 24)
                        .fontWeight(.bold)
                        .foregroundStyle(.darkblue700)
                    
                    ScrollView {
                        VStack(alignment : .leading, spacing: 12) {
                            AddPhotoButtonView()
                            
                            //MARK: - Information générales
                            InformationsSectionView(event: $event)
                            
                            //MARK: - Taches à faire
                            TaskSectionView(event: $event)
                            
                            //MARK: - Invitation
                            ParticipantsSectionView(event: $event)
                            
                            // MARK: - Save button
                            
                            // TODO: rendre fonctionnel le bouton
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.green700)
                                    .frame(height: 48)
                                Text("Créer l'évènement")
                                    .jakarta(size: 20)
                                    .foregroundColor(.darkblue50)
                            }
                            .padding(.top, 20)

                        }
                    }
                    .scrollIndicators(.hidden)
                }.padding()
            }
            
        }
    }
}

#Preview {
    CreateEventView()
}



// padding entre Date || Heure et leurs textfields, ça vient d'où?
// mettre le text indicator des textfields de la même couleur que celui du textEditor ou inversement

// problème pour modifier le picker


