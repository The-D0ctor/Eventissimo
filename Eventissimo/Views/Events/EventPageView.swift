//
//  EventDescriptionView.swift
//  Eventissimo
//
//  Created by apprenant80 on 07/03/2025.
//

import SwiftUI

struct EventPageView: View {
    
    var eventPage: Event
    
    @State private var isAccepted = false
    
    @State var listOptions: PickerChoiceViewModel = PickerChoiceViewModel(listChoices: ["Participent", "Ne participent pas"])
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                EventPageCardView(eventPage: eventPage)
                Text(eventPage.description)
                    .jakarta(size: 14)
                    .foregroundStyle(.green900)
                    .padding(.horizontal, 10)
                
                Button(action: {
                    isAccepted.toggle()
                    // 🙋‍♀️ Lucie : je n'ai pas réussi à ajouter la fonctionalité suivante : cliquer sur "Accepter l'invitation" ajoute la personne au tableau de Participants de l'event concerné, et inversement
                }) {
                    Text(isAccepted ? "✓  Acceptée !" : "Accepter l'invitation")
                        .jakarta(size: 16)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isAccepted ? Color.green200 : Color.green700)
                        .foregroundColor(isAccepted ? Color.darkblue400 : Color.white)
                        .fontWeight(isAccepted ? .regular : .bold)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(isAccepted ? Color.darkblue200 : Color.clear, lineWidth: 1))
                        .cornerRadius(16)
                }
                .animation(.easeInOut(duration: 0.2), value: isAccepted)
                
                VStack {
                    PickerChoices(choices: listOptions)
                    
                    if listOptions.selectedChoice == 0 {
                        ParticipantsView(participants: eventPage.participants, isBlackAndWhite: false)
                    } else {
                        ParticipantsView(participants: events[3].participants, isBlackAndWhite: true) // 🙋‍♀️ Lucie : je n'ai pas réussi à mettre les "Non participants" ici. A la place, j'ai mis les photos de profil de l'évent [3] pour qu'il s'affiche quelque chose mais c'est du "fake" quoi
                    }
                }
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                    VStack(alignment: .leading) {
                        Text("Tâches accomplies")
                            .serif(size: 18)
                            .foregroundStyle(Color.darkblue700)
                        ProgressView(value: Double(eventPage.tasksPercentage) / 100)
                                .progressViewStyle(LinearProgressViewStyle(tint: Color.green700))
                                .frame(height: 8)
                                .background(Color.green200.opacity(0.3))
                                .cornerRadius(4)
                            
                            Text("\(eventPage.tasksPercentage)%")
                                .jakarta(size: 14)
                                .foregroundStyle(Color.darkblue700)
                        Text("Derniers achats")
                            .serif(size: 18)
                            .foregroundStyle(Color.darkblue700)
                            .padding(.top, 8)
                        Text("Mettre les derniers achats") // 🙋‍♀️ Lucie : à revoir il faut coder cette partie
                            .jakarta(size: 12)
                            .foregroundStyle(Color.darkblue200)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
                Text("Ouvrir la discussion")
                    .jakarta(size: 14)
                    .foregroundStyle(Color.darkblue200)
                Button {
                        // 🙋‍♀️ Lucie : à revoir pour ouvrir la discussion de l'évènement concerné
                    
                } label: {
                    Image("openConv")
                }
            }
            .padding(.horizontal, 24)
        }
        .background(Color.darkblue50)
    }
}

#Preview {
    EventPageView(eventPage: events[1])
}


