//
//  EventPageCardView.swift
//  Eventissimo
//
//  Created by apprenant80 on 10/03/2025.
//


import SwiftUI

struct EventPageCardView: View {
    
    var event: EventApp
    
    var body: some View {
        ZStack(alignment: .bottom)  {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 345, height: 460)
                .cornerRadius(20)
                .clipped()
            CardGradient(width: 345, height: 460)
            VStack(alignment: .leading, spacing: 10) {
                Text(event.name)
                    .serif(size: 24)
                    .foregroundStyle(.white)
                HStack {
                    Image("calendar")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text(event.date.formattedInFrench())
                        .jakarta(size: 16)
                    Spacer()
                    Image(systemName: "clock")
                        .font(.system(size: 14))
                    Text(event.date.formatted(date: .omitted, time: .shortened))
                        .jakarta(size: 16)
                }
                .foregroundStyle(.green200)
                HStack {
                    Image("map_pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    Text(event.localization)
                        .jakarta(size: 16)
                }
                .foregroundStyle(.green500)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 15)
        }
    }
}

#Preview {
    EventPageCardView(event: events[1])
}
