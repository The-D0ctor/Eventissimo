//
//  EventDescriptionView.swift
//  Eventissimo
//
//  Created by apprenant80 on 07/03/2025.
//

import SwiftUI

struct EventPageView: View {
    var dataBase: DataBase
    
    @Binding var event: EventApp
    
    @State private var isAccepted = false
    
    @State var listOptions: PickerChoiceViewModel = PickerChoiceViewModel(listChoices: ["Participent", "Ne participent pas"], selectedButtonBackgroundColor: Color.green650, textColor: Color.white)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    EventPageCardView(event: event)
                    Text(event.description)
                        .jakarta(size: 14)
                        .foregroundStyle(.green900)
                        .padding(.horizontal, 10)
                    
                    Button {  withAnimation(.easeInOut(duration: 0.2)) {
                        isAccepted.toggle()
                        // 🙋‍♀️ Lucie : ajouter la fonctionalité : cliquer sur "Accepter l'invitation" ajoute la personne au tableau de Participants de l'event concerné, et inversement
                    } } label: {
                        Text(isAccepted ? "✓  Acceptée" : "Accepter l'invitation")
                            .jakarta(size: 16)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isAccepted ? Color.green200 : Color.green650)
                            .foregroundColor(isAccepted ? Color.darkblue400 : Color.white)
                            .fontWeight(isAccepted ? .regular : .bold)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(isAccepted ? Color.darkblue200 : Color.clear, lineWidth: 1))
                            .cornerRadius(16)
                    }
                    .animation(.easeInOut(duration: 0.2), value: isAccepted)
                    
                    VStack {
                        PickerChoices(choices: listOptions)
                        NavigationLink(destination: GuestsListView(dataBase: dataBase, event: event)) {
                            if listOptions.selectedChoice == 0 {
                                ParticipantsView(participants: event.participants, isBlackAndWhite: false)
                            } else {
                                ParticipantsView(participants: event.nonParticipants, isBlackAndWhite: true)
                            } }
                    }
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                        VStack(alignment: .leading) {
                            Text("Tâches accomplies")
                                .serif(size: 18)
                                .foregroundStyle(Color.darkblue700)
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.darkblue200.opacity(0.3))
                                    .frame(height: 20)
                                    .opacity(0.8)
                                ZStack(alignment: .trailing) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill( LinearGradient(
                                            gradient: Gradient(colors: [Color.green200, Color.green500]),
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                        .frame(width: CGFloat(event.tasksPercentage) / 100 * 340, height: 20)
                                        .shadow(color: Color.green200.opacity(0.8), radius: 2, x: 0, y: 2)
                                        .animation(.easeInOut(duration: 0.3), value: event.tasksPercentage)
                                    Text("\(event.tasksPercentage)%")
                                        .jakarta(size: 14)
                                        .foregroundStyle(Color.white)
                                        .fontWeight(.heavy)
                                        .padding(.trailing, 10)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            NavigationLink(destination: {
                                BudgetView(dataBase: dataBase, viewModel: BudgetViewModel(evenement: event))
                            }, label: {
                                VStack(alignment: .leading){
                                    Text("Derniers achats")
                                        .serif(size: 18)
                                        .foregroundStyle(Color.darkblue700)
                                        .padding(.top, 8)
                                    Text("Mettre les derniers achats") // 🙋‍♀️ Lucie : à revoir il faut coder cette partie
                                        .jakarta(size: 12)
                                        .foregroundStyle(Color.darkblue200)
                                }
                            })
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                    }
                    NavigationLink {
                        MessagesListView(dataBase: dataBase, image: event.image, title: event.name, messages: $event.eventMessages, isEvent: true)
                    } label: {
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right")
                                .font(.system(size: 14))
                            Text("Ouvrir la discussion")
                                .jakarta(size: 14)
                                .fontWeight(.medium)
                        }
                        .frame(width: 345, height: 40)
                        .foregroundColor(Color.green650)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.green650, lineWidth: 1)
                        )
                    }
                    .background(Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .animation(.easeInOut(duration: 0.2), value: isAccepted)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
            .background(Color.darkblue50)
        }
    }
}
#Preview {
    EventPageView(dataBase: DataBase(), event: Binding.constant(events[1]))
        .environment(DataBase())
}


