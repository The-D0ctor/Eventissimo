//
//  ParticipantsSectionView.swift
//  Eventissimo
//
//  Created by Maxime Point on 13/03/2025.
//


import SwiftUI

struct ParticipantsSectionView: View {
    @State var pickerChoice = ERole.guest
    @Binding var event: EventApp
    
    @State var searchPerson = ""
    var body: some View {
        
        
        VStack(alignment : .leading, spacing: 12) {
            
            VStack (alignment: .leading){
                Divider()
                ZStack{
                    VStack (alignment: .leading){
                        Text("Invitation")
                            .serif(size: 20)
                            .foregroundStyle(.darkblue700)
                        
                        if !$event.participants.isEmpty {
                            ForEach(event.participants, id: \.person.id) { participant in
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
                                        .padding(6)
                                        .background(.green900)
                                        .cornerRadius(4)
                                        .padding(4)
                                    case .guest:
                                        HStack {
                                            Text("Invité(e)")
                                                .jakarta(size: 12)
                                                .foregroundStyle(.darkblue700)
                                        }
                                        .padding(6)
                                        .background(.white)
                                        .cornerRadius(4)
                                        .padding(4)
                                    case .volunteer:
                                        HStack {
                                            Text("Bénévole")
                                                .jakarta(size: 12)
                                                .foregroundStyle(.darkblue700)
                                        }
                                        .padding(6)
                                        .background(.white)
                                        .cornerRadius(4)
                                        .padding(4)
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
                    
                    
                }
                
                
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
                        
                        
                        
                        if !searchPerson.isEmpty && event.listUsers.filter({ users in
                            users.person.name.lowercased().contains(searchPerson.lowercased())
                        }).isEmpty == false {
                            
                            
                            VStack{
                                
                                
                                ForEach(event.listUsers.filter { users in
                                    users.person.name.lowercased().contains(searchPerson.lowercased())
                                })
                                { newInvite in
                                    
                                    Button(action:{
                                        var newParticipant = newInvite
                                        newParticipant.role = pickerChoice
                                        event.participants.append(newParticipant)
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
                                        
                                    }
                                    )
                                    
                                }
                            }
                            .padding()
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                        }
                        
                    }
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.darkblue200, lineWidth: 1)
                            .opacity(0.4)
                    )
                    
                
                
                
            }
            
            Text("Lien d'invitation")
                .jakarta(size: 16)
                .foregroundStyle(.darkblue700).padding(.bottom, -6)
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
    ParticipantsSectionView(event: .constant(events[0]))
        .background(.darkblue50)
}
