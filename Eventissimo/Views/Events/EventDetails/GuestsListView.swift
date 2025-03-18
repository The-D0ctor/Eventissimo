import SwiftUI

struct GuestsListView: View {
    var dataBase: DataBase
    var selectedChoice: Int = 0
    @State var viewModel: GuestSelectionViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State var listOptions: PickerChoiceViewModel = PickerChoiceViewModel(listChoices: ["Participent", "Ne participent pas"])
    //    @State private var showOptions = false
    @State private var showGuestSelectionSheet = false
    
    @State private var invitationLink: String = "eventissimo/1231312/47"
    @State private var showInvitationLink = false
    @State private var showCopiedPopup = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            HStack {
                Button {
                    dismiss()
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
                                ForEach(viewModel.event.participants, id: \.person.id) { participant in
                                    NavigationLink(destination: ProfileView(dataBase: dataBase, person: participant.person).navigationBarBackButtonHidden()) {
                                        GuestRowView(participant: participant)
                                    }
                                    Divider()
                                }
                            } else {
                                ForEach(viewModel.event.nonParticipants, id: \.person.id) { participant in
                                    NavigationLink(destination: ProfileView(dataBase: dataBase, person: participant.person).navigationBarBackButtonHidden()) {
                                        GuestRowView(participant: participant)
                                    }
                                    Divider()
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                    }
                    VStack {
                        Button {
                            showGuestSelectionSheet = true
                        } label: {
                            Text("Ajouter manuellement")
                                .jakarta(size: 14)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.green650)
                        .cornerRadius(12)
                        
                        Text("Envoyer une invitation")
                            .jakarta(size: 14)
                            .fontWeight(.medium)
                            .foregroundStyle(.darkblue400)
                            .padding(.top, 30)
                        
                        
                        HStack {
                            Image("lien")
                            Text(invitationLink).jakarta(size: 12).foregroundColor(.darkblue200)
                            Spacer()
                            Image("copier")
                        }
                        .padding(.leading, 10)
                        .foregroundColor(.gray)
                        .frame(width: 230, height: 25)
                        .background(Color.white)
                        .cornerRadius(8)
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
                        
                        if showCopiedPopup == true {
                            Text("Copié !")
                                .jakarta(size: 12)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(8)
                                .transition(.opacity)
                                .animation(.easeInOut, value: showCopiedPopup)
                        }
                    }
                    
                }
                .padding(.top, 20)
            }
        }
        .padding(.horizontal, 24)
        .background(Color.darkblue50)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showGuestSelectionSheet) {
            GuestSelectionSheet(viewModel: $viewModel)
        }
        .gesture(TapGesture().onEnded {
            withAnimation {
                showInvitationLink = false
            }
        })
        .onAppear {
            listOptions.selectedChoice = selectedChoice
        }
    }
    
}


#Preview {
    GuestsListView(dataBase: DataBase(), selectedChoice: 0, viewModel: GuestSelectionViewModel(event: events[1]))
}
