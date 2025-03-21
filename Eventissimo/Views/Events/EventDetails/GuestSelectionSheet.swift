//
//  GuestSelectionSheet.swift
//  Eventissimo
//
//  Created by apprenant103 on 17/03/2025.
//


import SwiftUI

struct GuestSelectionSheet: View {
    @State var guests: [Person] = []
    @Binding var event: EventApp
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Fermer")
                            .jakarta(size: 12)
                            .tint(.redCategoryBudget)
                    }
                    Spacer()
                    Text("Qui inviter ?")
                        .serif(size: 18)
                        .fontWeight(.bold)
                        .foregroundStyle(.darkblue700)
                    Spacer()
                    Button {
                        for participant in guests{
                            
                            event.participants.append(Participant(person: participant, role: .guest))
                        }
                        dismiss()
                    } label: {
                        Text("Valider")
                            .jakarta(size: 12)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.green650)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top)
                List(event.listUsers) { user in
                    
                    HStack {
                        
                        (user.person.profilePicture ?? Image(""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.horizontal)
                        Text(user.person.name)
                            .jakarta(size: 14)
                            .fontWeight(.semibold)
                            .foregroundStyle(.darkblue700)
                        
                        Spacer()
                        Button {
                            if guests.contains(user.person){
                                guests.removeAll { guest in
                                    guest.id == user.person.id
                                }
                            }
                            else{
                                guests.append(user.person)
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.black, lineWidth: 1)
                                    .fill( guests.contains(user.person) ? Color.green650 : Color.white)
                                    .frame(width: 24, height: 24)
                                
                                if guests.contains(user.person){
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.white)
                                }
                                
                                
                                
                            }
                        }
                    }
                    .contentShape(Rectangle())
                }
                .listStyle(.insetGrouped)
            }
        }
    }
}

#Preview {
    GuestSelectionSheet(event: .constant(events[0]))
}
