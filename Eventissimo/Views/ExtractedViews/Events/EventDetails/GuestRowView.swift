//
//  GuestRowView.swift
//  Eventissimo
//
//  Created by apprenant80 on 12/03/2025.
//


import SwiftUI

struct GuestRowView: View {
    
    @Binding var participant: Participant
    @Binding var event: EventApp
    var participe: Bool
    var body: some View {
        HStack(spacing: 12) {
            (participant.person.profilePicture ?? Image(""))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(participant.person.name)
                    .jakarta(size: 14)
                    .fontWeight(.semibold)
                    .foregroundStyle(.darkblue700)
                
                if let roleLabel = participant.role?.rawValue { // unwrap optionnal avec if let. C'est pour rendre plus custom que la valeur par défaut, ou même ne rien afficher du tout si c'est nil
                    Text(roleLabel)
                        .jakarta(size: 12)
                        .fontWeight(.regular)
                        .foregroundColor(.darkblue200)
                } else {
                    Text("Non participant")
                        .jakarta(size: 12)
                        .fontWeight(.regular)
                        .foregroundColor(.darkblue200)
                }
            }
            Spacer()
            
            
            
            if event.participants.contains(participant) && !(participant.role == .organizer) && participe{
                Menu("Rôle") {
                    
                    
                    Button (action:{
                        participant.role = .volunteer
                    }, label:{
                        Text("Bénévole")
                    })
                    
                    Button (action:{
                        participant.role = .guest
                    }, label:{
                        Text("Invité")
                    })
                    
                    Button (action:{
                        participant.role = .organizer
                    }, label:{
                        Text("Organisateur")
                    })
                }
                
                Button(action:{
                    
                    event.participants.removeAll { guest in
                        guest.id == participant.id
                    }
                       }, label:{
                           
                    Image(systemName: "minus.circle.fill")
                        .foregroundStyle(.red)
                        .tint(.red)
                })
            }
        }
        .padding(.vertical, 4)
    }
}
#Preview {
    GuestRowView(participant: Binding.constant(Participant(person: marion, role: .organizer)), event: .constant(events[0]), participe: true)
}

