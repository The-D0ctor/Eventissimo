import SwiftUI

struct GuestsListView: View {
    var event: EventApp
    
    
    
    @Environment(\.dismiss) var dismiss // var pour cacher la navbar
    
    @State var listOptions: PickerChoiceViewModel = PickerChoiceViewModel(listChoices: ["Participent", "Ne participent pas"])
    @State private var showOptions = false
    @State private var showGuestSelectionSheet = true
    
    @State private var invitationLink: String = "http://example.com/invitation-link"
    @State private var showInvitationLink = false
    @State private var showCopiedPopup = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            HStack {
                Button {
                    dismiss() // ici c'est le bouton "Back"
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24))
                        .foregroundStyle(.darkblue700)
                        .padding(10)
                }
                Spacer()
                Text("Liste des invités")
                    .serif(size: 24)
                    .fontWeight(.bold)
                    .foregroundStyle(.darkblue700)
                Spacer()
                Image(systemName: "gearshape")
                    .opacity(0)
                    .padding(10)
            }
            PickerChoices(choices: listOptions)
                .padding(.bottom, 10)
            ScrollView {
                VStack(spacing: 34) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                        VStack {
                            if listOptions.selectedChoice == 0 {
                                ForEach(event.participants, id: \.person.id) { participant in
                                    GuestRowView(participant: participant)
                                        .contentShape(Rectangle())
                                        .swipeActions(edge: .trailing) {
                                            // 🙋‍♀️ Le swipe de droite à gauche ne fonctionne pas. A revoir ici et ajouter les fonctionnalités des boutons
                                            Button(role: .destructive) {
                                                // 🙋‍♀️ Ajouter ici la logique pour supprimer un invité
                                            } label: {
                                                Label("Supprimer", systemImage: "trash")
                                            }
                                            .tint(.red)
                                            Button {
                                                // 🙋‍♀️ Ajouter ici la logique pour définir un admin
                                            } label: {
                                                Label("Admin", systemImage: "person.fill.badge.plus")
                                            }
                                            .tint(.blue)
                                        }
                                    Divider()
                                }
                            } else {
                                ForEach(event.nonParticipants, id: \.person.id) { participant in
                                    GuestRowView(participant: participant)
                                    Divider()
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                    }
                    VStack {
                        HStack(spacing: 10) {
                            if showOptions == true {
                                Button {
                                    showGuestSelectionSheet = true
                                    // 🙋‍♀️ à faire : ajouter le fait de pouvoir cocher et rajouter les nouveaux invités
                                    showOptions = false
                                } label: {
                                    Text("Ajouter manuellement")
                                        .jakarta(size: 12)
                                }
                                .foregroundColor(.white)
                                .frame(width: 100, height: 40)
                                .background(Color.green650)
                                .cornerRadius(10)
                            }
                            Button {
                                //withAnimation {
                                showOptions.toggle()
                                showInvitationLink = false
                                //}
                            } label: {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.green650)
                            }
                            .animation(.easeInOut, value: showOptions)
                            if showOptions == true {
                                Button {
                                    showOptions = true
                                    showInvitationLink = true
                                } label: {
                                    Text("Générer un lien")
                                        .jakarta(size: 12)
                                }
                                .foregroundColor(.white)
                                .frame(width: 100, height: 40)
                                .background(Color.green650)
                                .cornerRadius(10)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        if showInvitationLink == true {
                            HStack {
                                Text(invitationLink)
                                    .jakarta(size: 12)
                                Image(systemName: "document.on.document")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                            }
                            .foregroundColor(.gray)
                            .frame(width: 230, height: 25)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.top, 10)
                            .shadow(color: Color.black.opacity(0.2), radius: 2)
                            .onTapGesture {
                                UIPasteboard.general.string = invitationLink
                                withAnimation {
                                    showCopiedPopup = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        showCopiedPopup = false
                                    }
                                }
                            }
                        }
                        if showCopiedPopup == true {
                            Text("Copié !")
                                .jakarta(size: 12)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(12)
                                .transition(.opacity)
                                .animation(.easeInOut, value: showCopiedPopup)
                        }
                    }
                    .padding(.top, 20)
                }
            }
        }
        .padding(.horizontal, 24)
        .background(Color.darkblue50)
        .navigationBarBackButtonHidden(true) // ici pour cacher la navBar
        .sheet(isPresented: $showGuestSelectionSheet) {
            GuestSelectionSheet() // ici ça affiche la liste des users
        }
        .gesture(TapGesture().onEnded {
            withAnimation {
                showInvitationLink = false
                showOptions = false
            }
        })
    }
}

struct GuestSelectionSheet: View {
    @State var guests: [Person] = []
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Fermer")
                        .opacity(0)
                    Spacer()
                    Text("Qui inviter ?")
                        .serif(size: 18)
                        .fontWeight(.bold)
                        .foregroundStyle(.darkblue700)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Text("Fermer")
                            .jakarta(size: 12)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top)
                List(users) { user in
                    
                    HStack {
                        Image(user.profilePicture ?? "Pas de photo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.horizontal)
                        Text(user.name)
                            .jakarta(size: 14)
                            .fontWeight(.semibold)
                            .foregroundStyle(.darkblue700)
                        
                        Spacer()
                        Button {
                            if guests.contains(user){
                                guests.removeAll { guest in
                                    guest.id == user.id
                                }
                            }
                            else{
                                guests.append(user)
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.black, lineWidth: 1)
                                    .fill( guests.contains(user) ? Color.green650 : Color.white)
                                    .frame(width: 24, height: 24)
                            
                                if guests.contains(user){
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
    GuestsListView(event: events[1])
}
