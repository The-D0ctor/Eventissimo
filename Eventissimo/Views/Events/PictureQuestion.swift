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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 274, height: 340)
                .foregroundColor(.green200)
            VStack (alignment: .center, spacing: 40){
                Text("Une photo qui va bien?")
                    .multilineTextAlignment(.center)
                PhotosPicker("Upload picture", selection: $avatarItem, matching: .images)
                
                avatarImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
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
    PictureQuestion()
}
