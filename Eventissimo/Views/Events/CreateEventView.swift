//
//  CreateEventView.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 11/03/2025.
//

import SwiftUI

struct CreateEventView: View {
    @State var eventName = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkblue50.ignoresSafeArea()
                VStack {
                    Text("Créer un évènement")
                        .serif(size: 24)
                        .fontWeight(.bold)
                        .foregroundStyle(.darkblue700)
                    ScrollView {
                        VStack (alignment : .leading, spacing: 4){
                            ZStack{
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(style: StrokeStyle(
                                        lineWidth: 1,
                                        dash: [6,6]
                                    ))
                                    .frame(width: 345, height: 143).foregroundStyle(.green500)
                                HStack{
                                    ZStack{
                                        Circle()
                                            .frame(width: 40)
                                            .foregroundStyle(.green200)
                                        Image("uploadImage")
                                    }
                                    Text("Ajouter une photo").jakarta(size: 16)
                                    
                                }
                                
                                
                            }
                            Rectangle()
                                .frame(width: 345, height: 1)
                                .foregroundStyle(.darkblue200)
                                .opacity(0.4)
                                .padding(.top, 20)
                                .padding(.bottom, 20)
                            Text("Informations générales")
                                .serif(size: 20)
                                .foregroundStyle(.darkblue700)
                                .padding(.bottom, 12)

                            Text("Nom")
                                .jakarta(size: 16)
                                .foregroundStyle(.darkblue700)
                            TextField("Écrire un nom", text: $eventName)
                                .padding()
                                .frame(width: 345, height: 48)
                                .background(Color.white)
                                .cornerRadius(12)
                                .foregroundColor(.darkblue700)
                                .padding(.bottom, 12)
                            Text("Description")
                                .jakarta(size: 16)
                                .foregroundStyle(.darkblue700)
                            ZStack {
                                TextEditor(text: $eventName)
                                    .padding()
                                    .frame(width: 345, height: 137)
                                    .background(Color.white).foregroundStyle(.darkblue700)
                                    .cornerRadius(12)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 12)
                                if eventName.isEmpty {
                                                Text("Écrivez votre description ici")
                                        .foregroundColor(.darkblue200)
                                                    
                                            }
                            }
                            Text("Adresse")
                                .jakarta(size: 16)
                                .foregroundStyle(.darkblue700)
                            TextField("Écrire une adresse", text: $eventName)
                                .padding()
                                .frame(width: 345, height: 48)
                                .background(Color.white)
                                .cornerRadius(12)
                                .foregroundColor(.darkblue700)
                                .padding(.bottom, 12)
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Date")
                                        .jakarta(size: 16)
                                        .foregroundStyle(.darkblue700)
                                    ZStack {
                                        TextField("", text: $eventName)
                                            .padding()
                                            .frame(width: 164.5, height: 48)
                                            .background(Color.white)
                                            .cornerRadius(12)
                                            .foregroundColor(.darkblue700)
                
                                        Image("calendar")
                                            .padding(.leading, 110)
                                    }
                                    
                                }
                                VStack(alignment: .leading){
                                    Text("Heure")
                                        .jakarta(size: 16)
                                        .foregroundStyle(.darkblue700)
                                    ZStack {
                                        TextField("", text: $eventName)
                                            .padding()
                                            .frame(width: 164.5, height: 48)
                                            .background(Color.white)
                                            .cornerRadius(12)
                                            .foregroundColor(.darkblue700)
                                            
                                        Image(systemName: "clock")
                                            .padding(.leading, 110)
                                    }
                                    
                                }
                                
                            }
                            Rectangle()
                                .frame(width: 345, height: 1)
                                .foregroundStyle(.darkblue200)
                                .opacity(0.4)
                                .padding(.top, 20)
                                .padding(.bottom, 20)
                            Text("Invitation")
                                .serif(size: 20)
                                .foregroundStyle(.darkblue700)
                                .padding(.bottom, 12)
                            HStack{
                                Text("Alexis")
                                    .foregroundStyle(.darkblue700)
                                    .jakarta(size: 12)
                                Spacer()
                                    
                                ZStack{
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 106, height: 24).foregroundStyle(.green900)
                                    HStack{
                                        Image("crownOrga")
                                        Text("Organisateur")
                                            .jakarta(size: 12)
                                            .foregroundStyle(.darkblue50)
                                            
                                    }
                                }
                                Image("crossDelete")
                                    
                                
                            }.frame(width: 345, height: 24)
                            HStack{
                                Text("Chloé")
                                    .foregroundStyle(.darkblue700)
                                    .jakarta(size: 12)
                                Spacer()
                                    
                                ZStack{
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 60, height: 24).foregroundStyle(.white)
                                    
                                        Text("Invité(e)")
                                            .jakarta(size: 12)
                                            .foregroundStyle(.darkblue700)
                                            
                                    
                                }
                                Image("crossDelete")
                                    
                                
                            }.frame(width: 345, height: 24)
                            ZStack{
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.darkblue200)
                                    .frame(width: 345, height: 120)
                                    .opacity(0.4)
                                VStack {
                                    ZStack{
                                        TextField("Inviter des amis", text: $eventName)
                                            .padding()
                                            .frame(width: 329, height: 48)
                                            .background(Color.white)
                                            .cornerRadius(12)
                                            .foregroundColor(.darkblue700)
                                        HStack {
                                            Spacer()
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(Color.green200)
                                                    .frame(width: 74, height: 30)
                                                HStack {
                                                    Text("Invité(e)").jakarta(size: 12).foregroundColor(.darkblue700)
                                                    Image(systemName: "chevron.down").foregroundColor(.darkblue700).font(.system(size: 11))
                                                }
                                                
                                            }.padding(.trailing, 8)
                                        }.frame(width: 329, height: 48)
                                        
                                    }
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.green700)
                                            .frame(width: 329, height: 48)
                                        Text("Envoyer l'invitation").jakarta(size: 16).foregroundColor(.darkblue50)
                                            
                                        
                                    }
                                    
                                }
                                    
                                
                            }.padding(.top, 8)
                            
                            

                            
                            
                            
                        }
                        
                    }.scrollIndicators(.hidden)
                }
            }
            
        }
    }
}

#Preview {
    CreateEventView()
}



// padding entre Date || Heure et leurs textfields, ça vient d'où?
// mettre le text indicator des textfields de la même couleur que celui du textEditor ou inversement
// padding entre Alexis et organisateur, à la mano?
