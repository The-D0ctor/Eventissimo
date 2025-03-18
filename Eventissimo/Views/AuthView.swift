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
    
    var body: some View {
        let viewModel = AuthViewModel(dataBase: dataBase)
        NavigationStack {
            if (selectedUser != nil) {
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
                
                NavigationLink {
                    ContentView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Valider")
                        .foregroundStyle(.darkblue900)
                }
                .padding()
                .background(.green650)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .simultaneousGesture(TapGesture().onEnded({ _ in
                    viewModel.dataBase.currentUser = selectedUser!
                }))
            }
        }
        .foregroundStyle(.green900)
        .onAppear {
            viewModel.getUsers()
        }
        .onChange(of: viewModel.dataBase.persons) { oldValue, newValue in
            if (oldValue.isEmpty && !newValue.isEmpty) {
                selectedUser = newValue.first
            }
        }
    }
}

#Preview {
    AuthView()
        .environment(DataBase())
}
