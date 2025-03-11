//
//  TeamQuestion.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 07/03/2025.
//

import SwiftUI

struct TeamQuestion: View {
    @State private var teamNames: [String] = []  // Tableau pour stocker les valeurs des TextField
    @State private var currentName: String = ""  // Variable pour le texte saisi dans le TextField
    @Binding var selectedTab: Int


    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 274, height: 400)
                .foregroundColor(.green200)
            
            VStack (alignment: .center, spacing: 20){
                Text("Une équipe pour s'organiser?")
                    .jakarta(size: 18)
                
                TextField("Entrez un nom", text: $currentName)  // Utilisation de currentName pour saisir du texte
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(20)
                
                
//                ScrollView {
//                    VStack(spacing: 10) {
//                        ForEach(0..<teamNames.count, id: \.self) { index in
//                            TextField("Nom", text: $teamNames[index])  // Chaque TextField lié à une chaîne dans le tableau
//                                .padding(10)
//                                .background(Color.white)
//                                .cornerRadius(20)
//                        }
//                    }
//                    
//                    
//                }
                if !teamNames.isEmpty {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(teamNames, id: \.self) { name in
                                Text(name)  // Affichage de chaque nom dans la liste
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                Button {
                    if !currentName.isEmpty {
                                            teamNames.append(currentName)
                                            currentName = ""  // Réinitialise le champ TextField après l'ajout
                                        }
                } label: {
                    Image("plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(15)
                        .background(Color.darkblue700)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                }
                HStack {
                    Button {
                        withAnimation {
                            selectedTab -= 1
                        }
                        
                        
                    } label : {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(15)
                            .background(Color.darkblue700)
                            .clipShape(Circle())
                            .foregroundStyle(.white)
                    
                        
                        
                    }
                    Button {
                        withAnimation {
                            selectedTab += 1
                        }
                        
                        
                    } label : {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(15)
                            .background(Color.darkblue700)
                            .clipShape(Circle())
                            .foregroundStyle(.white)
                        
                        
                    }
                }
                
                
                
            }.padding(25)
                .multilineTextAlignment(.center)
            
            
        }.frame(width: 274, height: 340)
    }
}

#Preview {
    TeamQuestion(selectedTab: .constant(0))
}
