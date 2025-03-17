//
//  EventCardView.swift
//  Eventissimo
//
//  Created by apprenant80 on 07/03/2025.
//


import SwiftUI

extension Date {
    func formattedInFrench() -> String { // fonction pour convertir la date en français, sans quoi elle s'afficherait en anglais
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "fr_FR") 
        return formatter.string(from: self)
    }
}

struct EventCardView: View {
    
    var event: EventApp

    
    var body: some View {
        ZStack(alignment: .bottomLeading)  {
            event.image?
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 210, height: 310)
                .cornerRadius(20)
                .clipped()
            CardGradient(width: 210, height: 310)
            VStack(alignment: .leading, spacing: 5) {
                Text(event.name)
                    .serif(size: 18)
                    .foregroundStyle(.white)
                HStack {
                    Image("calendar")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text(event.date.formattedInFrench())
                        .jakarta(size: 14)
                }
                .foregroundStyle(.green200)
                HStack {
                    Image("map_pin")
                        .resizable()
                        .scaledToFit()
                        .scaledToFill()
                        .frame(width: 16, height: 16)
                    Text(event.localization.components(separatedBy: " ").first ?? "")
                        .jakarta(size: 12)
                }
                .foregroundStyle(.green500)
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
        }
    }
}
#Preview {
    EventCardView(event: events[0])
}

