//
//  AuthView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 18/03/2025.
//

import SwiftUI

struct AuthView: View {
    @Environment(DataBase.self) var dataBase
    @State var selectedUser: Person?
    @State var isValidate: Bool = true
    var body: some View {
        let viewModel = AuthViewModel(dataBase: dataBase)
        VStack{
        if !isValidate {
            
            
            ZStack {
                Color.darkblue50.ignoresSafeArea()
                VStack {
                    if selectedUser != nil {
                        VStack {
                            Text("Sélectionnez un utilisateur")
                            selectedUser?.profilePicture?
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                            Picker("", selection: $selectedUser) {
                                ForEach(viewModel.dataBase.persons) { person in
                                    Text(person.name).tag(person)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.green900)
                        }
                        
                        Button {
                            viewModel.dataBase.currentUser = selectedUser!
                            viewModel.getPrivateConversationsForUser(userId: selectedUser!.id)
                            
                            isValidate = true
                        }
                        label: {
                            Text("Valider")
                                .foregroundStyle(.darkblue900)
                        }
                        .padding()
                        .background(.green650)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                }
            }
            .foregroundStyle(.green900)
            
        }
        
        else{
            ContentView()
        }
    }
            .onAppear {
                viewModel.getUsers()
            }
            .onChange(of: viewModel.dataBase.persons) { oldValue, newValue in
                if (oldValue.isEmpty && !newValue.isEmpty) {
                    selectedUser = marion
                    viewModel.getPrivateConversationsForUser(userId: selectedUser!.id)
                }
                
            }
        
    }
}

#Preview {
    AuthView()
        .environment(DataBase())
}
