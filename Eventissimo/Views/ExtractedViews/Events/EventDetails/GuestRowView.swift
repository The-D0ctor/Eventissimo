//
//  GuestRowView.swift
//  Eventissimo
//
//  Created by apprenant80 on 12/03/2025.
//


import SwiftUI

struct GuestRowView: View {
    
    let participant: Participant
    
    var body: some View {
        HStack(spacing: 12) {
            Image(participant.person.profilePicture ?? "defaultProfilePicture")
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
        }
        .padding(.vertical, 4)
    }
}
#Preview {
    GuestRowView(participant: Participant(person: marion, role: .organizer))
}

