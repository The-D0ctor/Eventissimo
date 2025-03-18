//
//  ParticipantsSectionView.swift
//  Eventissimo
//
//  Created by Maxime Point on 13/03/2025.
//


import SwiftUI

struct ParticipantsSectionView: View {
    
    @State var viewModel: GuestSelectionViewModel
    @Binding var event: EventApp
    @State var pickerChoice = ERole.organizer
    @State var newParticipant = Participant(person: Person(name: "", email: "", pronouns: .other), role: .volunteer)
    
    @State var searchPerson = ""
    var body: some View {
        VStack(alignment : .leading, spacing: 12) {
            
            VStack{
                Divider()
                ZStack{
                    VStack{
                        Text("Invitation")
                            .serif(size: 20)
                            .foregroundStyle(.darkblue700)
                        
                        if !event.participants.isEmpty {
                            ForEach($event.participants, id: \.person.id) { $participant in
                                HStack{
                                    
                                    Text(participant.person.name)
                                        .foregroundStyle(.darkblue700)
                                        .jakarta(size: 14)
                                    
                                    Spacer()
                                    
                                    switch participant.role {
                                    case .organizer:
                                        HStack{
                                            Image("crownOrga")
                                            Text("Organisateur")
                                                .jakarta(size: 12)
                                                .foregroundStyle(.darkblue50)
                                        }
                                        .padding(4)
                                        .background(.green900)
                                        .cornerRadius(4)
                                    case .guest:
                                        HStack {
                                            Text("Invité(e)")
                                                .jakarta(size: 12)
                                                .foregroundStyle(.darkblue700)
                                        }
                                        .padding(4)
                                        .background(.white)
                                        .cornerRadius(4)
                                    case .volunteer:
                                        HStack {
                                            Text("Bénévole")
                                                .jakarta(size: 12)
                                                .foregroundStyle(.darkblue700)
                                        }
                                        .padding(4)
                                        .background(.white)
                                        .cornerRadius(4)
                                    case .none:
                                        EmptyView()
                                    }
                                    
                                    
                                    Button {
                                        // remove activity
                                        if let index = event.participants.firstIndex(where: { $0.person.id == participant.person.id }) {
                                            event.participants.remove(at: index)
                                        }
                                    } label: {
                                        Image("crossDelete")
                                    }
                                }
                            }
                        }
                    }
                    if !searchPerson.isEmpty {
                        
                    
                    VStack{
                        
                            
                        ForEach(viewModel.event.listUsers.filter { users in
                            users.person.name.lowercased().contains(searchPerson.lowercased())
                        })
                        { newInvite in
                                HStack{
                                    (newInvite.person.profilePicture ?? Image(""))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
                                Spacer()
                                    Text(newInvite.person.name)
                                    .jakarta(size: 14)
                                
                            }
                        }
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 300)
                    }
                    
            }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.darkblue200)
                        .frame(height: 120)
                        .opacity(0.4)
                    VStack(spacing: 8) {
                        HStack {
                            TextField("Inviter des amis", text: $searchPerson)
                                .padding()
                                .frame(height: 48)
                                .background(Color.white)
                                .cornerRadius(12)
                                .foregroundColor(.darkblue700)
                            Spacer()
                            
                            // impossible de modifier le picker à part le tint
                            Picker("Appearance", selection: $pickerChoice) {
                                ForEach(ERole.allCases, id: \.self) { choice in
                                    Text(choice.rawValue)
                                        .padding()
                                        .background(.white)
                                        .cornerRadius(8)
                                }
                            }
                            .tint(.darkblue400)
                        }
                        
                        Button {
                            if !newParticipant.person.name.isEmpty {
                                newParticipant.role = pickerChoice
                                event.participants.append(newParticipant)
                                // Réinitialise le champ TextField après l'ajout :
                                newParticipant = Participant(person: Person(name: "", email: "", pronouns: .other), role: .volunteer)
                            }
                            
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.green700)
                                    .frame(height: 48)
                                
                                Text("Envoyer l'invitation")
                                    .jakarta(size: 16)
                                    .foregroundColor(.darkblue50)
                                
                                
                            }
                        }
                        
                        
                        
                        
                    }
                    .padding(8)
                    
                }
            }
            
            Text("Lien d'invitation")
                .jakarta(size: 16)
                .foregroundStyle(.darkblue700)
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .frame(height: 48)
                
                HStack{
                    HStack {
                        Image("lien")
                        
                        Text("eventissimo/1231312/47").jakarta(size: 16).foregroundColor(.darkblue200)
                    }.padding(.leading, 10)
                    Spacer()
                    Image("copier")}}
        }
        .padding()
    }
}

#Preview {
    ParticipantsSectionView(viewModel: GuestSelectionViewModel(event: events[0]),event: .constant(events[0]))
        .background(.darkblue50)
}
