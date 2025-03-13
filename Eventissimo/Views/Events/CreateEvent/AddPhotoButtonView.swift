//
//  AddPhotoButtonView.swift
//  Eventissimo
//
//  Created by Maxime Point on 13/03/2025.
//


import SwiftUI

struct AddPhotoButtonView: View {
    var body: some View {
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
                Text("Ajouter une photo")
                    .jakarta(size: 16)
            }
            
        }
        .padding()
    }
}
