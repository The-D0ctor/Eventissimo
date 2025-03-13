//
//  InformationsSectionView.swift
//  Eventissimo
//
//  Created by Maxime Point on 13/03/2025.
//


import SwiftUI

struct InformationsSectionView: View {
    
    @Binding var event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Divider()
            
            Text("Informations générales")
                .serif(size: 20)
                .foregroundStyle(.darkblue700)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Nom")
                    .jakarta(size: 16)
                TextField(text: $event.name) {
                    Text("Écrire un nom")
                        .jakarta(size: 16)
                }
                    .padding()
                    .frame(height: 48)
                    .background(Color.white)
                    .cornerRadius(12)
            }
            .foregroundColor(.darkblue700)
            
            
            VStack(alignment: .leading, spacing: 4)  {
                Text("Description")
                    .jakarta(size: 16)
                    .foregroundStyle(.darkblue700)
                ZStack {
                    TextEditor(text: $event.description)
                        .padding()
                        .frame(height: 137)
                        .background(Color.white)
                        .foregroundStyle(.darkblue700)
                        .cornerRadius(12)
                        .multilineTextAlignment(.leading)
                    if event.description.isEmpty {
                        Text("Écrivez votre description ici")
                            .foregroundColor(.darkblue200)
                        
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Adresse")
                    .jakarta(size: 16)
                TextField("Écrire une adresse", text: $event.localization)
                    .padding()
                    .frame( height: 48)
                    .background(Color.white)
                    .cornerRadius(12)
            }
            .foregroundStyle(.darkblue700)
            
            
            // TODO: mettre ici un date picker ;)
            //            HStack{
            //                VStack(alignment: .leading){
            //                    Text("Date")
            //                        .jakarta(size: 16)
            //                        .foregroundStyle(.darkblue700)
            //                    ZStack {
            //                        TextField("", text: $event.date)
            //                            .padding()
            //                            .frame(width: 164.5, height: 48)
            //                            .background(Color.white)
            //                            .cornerRadius(12)
            //                            .foregroundColor(.darkblue700)
            //
            //                        Image("calendar")
            //                            .padding(.leading, 114)
            //                    }
            //
            //                }
            //                VStack(alignment: .leading){
            //                    Text("Heure")
            //                        .jakarta(size: 16)
            //                        .foregroundStyle(.darkblue700)
            //                    ZStack {
            //                        TextField("", text: $event.hour)
            //                            .padding()
            //                            .frame(width: 164.5, height: 48)
            //                            .background(Color.white)
            //                            .cornerRadius(12)
            //                            .foregroundColor(.darkblue700)
            //
            //                        Image(systemName: "clock")
            //                            .padding(.leading, 114)
            //                    }
            //
            //                }
            //            }
            
            
        }
        .padding()
    }
}

#Preview {
    InformationsSectionView(event: .constant(events[0]))
        .background(.darkblue50)
}
