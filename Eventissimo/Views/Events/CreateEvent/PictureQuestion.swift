//
//  GuestsQuestion.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 07/03/2025.
//

// J'ai clairement copier coller le site de Hacking with swift pour celle là

import SwiftUI
import PhotosUI

struct PictureQuestion: View {
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @Binding var selectedTab: Int
    
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 274, height: 400)
                .foregroundColor(.green200)
            VStack (alignment: .center, spacing: 40){
                Text("Une photo qui va bien?")
                    .jakarta(size: 18)
                    .multilineTextAlignment(.center)
                
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 100, height: 100)
                PhotosPicker("Choisir une photo", selection: $avatarItem, matching: .images)
                
                
                avatarImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
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
            }
            .onChange(of: avatarItem) {
                Task {
                    if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                        avatarImage = loaded
                    } else {
                        print("Failed")
                    }
                }
            }
            
        }.frame(width: 274, height: 340)
        
        
        
    }
}

#Preview {
    PictureQuestion(selectedTab: .constant(0))
}
