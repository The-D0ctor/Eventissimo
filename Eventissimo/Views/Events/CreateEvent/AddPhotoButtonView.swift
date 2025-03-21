//
//  AddPhotoButtonView.swift
//  Eventissimo
//
//  Created by Maxime Point on 13/03/2025.
//


import SwiftUI
import PhotosUI

struct AddPhotoButtonView: View {
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @Binding var event: EventApp
    
    var body: some View {
        ZStack {
            if let avatarImage = avatarImage {
                avatarImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 210, height: 310)
                    .cornerRadius(20)
                    .clipped()
            } else {
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(style: StrokeStyle(
                            lineWidth: 1,
                            dash: [6,6]
                        ))
                        .frame(height: 143)
                        .foregroundStyle(.green500)
                    
                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(.green200)
                            Image("uploadImage")
                        }
                        PhotosPicker("Choisir une photo", selection: $avatarItem, matching: .images)
                    }
                    
                }
                .padding(.leading)
                .padding(.trailing)
                
            }
            
            
        }.onChange(of: avatarItem) {
            Task {
                if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                    avatarImage = loaded
                    event.image = loaded
                } else {
                    print("Failed")
                }
            }
        }
    }
}

#Preview {
    AddPhotoButtonView(event: .constant(events[0]))
        .background(.darkblue50)
}
