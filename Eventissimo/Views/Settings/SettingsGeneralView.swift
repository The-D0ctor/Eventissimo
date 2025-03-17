//
//  SettingsGeneralView.swift
//  Eventissimo
//
//  Created by apprenant80 on 07/03/2025.
//

import SwiftUI

struct SettingsGeneralView: View {
    var body: some View {
        NavigationStack{
            
            ZStack {
                Color.darkblue50.ignoresSafeArea()
                
            
                VStack {
                    Text("Paramètres")
                        .serif(size: 24)
                        .fontWeight(.bold)
                        .foregroundStyle(.darkblue700)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("Éditer mon profil")
                            .jakarta(size: 16)                }
                        Divider()
                        NavigationLink{
                            ParameterAppView()
                            
                        } label: {
                            HStack{
                                Image(systemName: "gearshape")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("Paramètres de l'application")
                                    .jakarta(size: 16)
                            }
                        }
                        Divider()
                        HStack{
                            Image(systemName: "shield")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("Sécurité")
                                .jakarta(size: 16)
                        }
                        Divider()
                        NavigationLink{
                            LegalInfoView()
                        } label: {
                            HStack{
                                Image(systemName: "book")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("Mentions légales")
                                    .jakarta(size: 16)
                            }
                            
                        }
                        
                        Divider()
                        HStack{
                            Image(systemName: "iphone.and.arrow.right.outward")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("Se déconnecter")
                                .jakarta(size: 16)
                        }.foregroundStyle(.red)
                        Spacer()
                        Button{
                            //
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.red)
                                    .frame(height: 44)
                                Text("Supprimer mon compte")
                                    .jakarta(size: 16)
                                    .foregroundStyle(.red)
                            }
                            
                        }
                        
                        
                        
                    }.foregroundStyle(.darkblue700)
                        .padding(.top, 40)
                }.padding(36)
            
            
            
            
            
        }
        }
    }
}

#Preview {
    SettingsGeneralView()
}
