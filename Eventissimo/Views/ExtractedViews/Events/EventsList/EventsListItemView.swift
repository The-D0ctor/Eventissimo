//
//  EventItemView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 07/03/2025.
//

import SwiftUI

struct EventsListItemView: View {
    var event: EventApp
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }
    
    var body: some View {
        ZStack {
            event.image?
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 437.5)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            CardGradient(width: 300, height: 437.5)
            VStack(alignment: .leading, spacing: 5) {
                Text(event.name)
                    .serif(size: 22)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                HStack {
                    Image("calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    Text(dateFormatter.string(from: event.date))
                        .jakarta(size: 14)
                        .fontWeight(.medium)
                }
                .foregroundStyle(.green200)
                HStack {
                    Image("map_pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    Text(event.localization
                        .components(separatedBy: " ").first ?? "")
                        .jakarta(size: 12)
                }
                .foregroundStyle(.green500)
            }
            .padding()
            .frame(width: 300, height: 437.5, alignment: .bottomLeading)
        }
    }
}

#Preview {
    EventsListItemView(event: events[0])
}
