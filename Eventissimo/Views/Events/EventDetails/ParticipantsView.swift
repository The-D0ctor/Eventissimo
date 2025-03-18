//
//  ParticipantsView.swift
//  Eventissimo
//
//  Created by apprenant80 on 10/03/2025.
//

import SwiftUI

struct ParticipantsView: View {
    
    var participants: [Participant]
    var isBlackAndWhite: Bool
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
//                    .opacity(0.8)
                HStack(spacing: -6) {
                    ForEach(participants, id: \.person.email) { participant in
                        (participant.person.profilePicture ??  Image(""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .grayscale(isBlackAndWhite ? 1.0 : 0.0)
                            .padding(.vertical, 10)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}


#Preview {
    ParticipantsView(participants: [Participant(person: users[0], role: .organizer)], isBlackAndWhite: false)
}
