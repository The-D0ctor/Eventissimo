//
//  DiscussionDetailView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 12/03/2025.
//

import SwiftUI

struct DiscussionDetailView: View {
    var image: String
    var title: String
    var messages: [MessageApp]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }
    
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .jakarta(size: 16)
                    .fontWeight(.semibold)
                if (messages.last != nil) {
                    Text(messages.last!.text)
                        .jakarta(size: 12)
                }
            }
            Spacer()
            if (messages.last != nil) {
                VStack(alignment: .trailing, spacing: 5) {
                    Text(dateFormatter.string(from: messages.last!.date))
                        .jakarta(size: 10)
                    Text(timeFormatter.string(from: messages.last!.date))
                        .jakarta(size: 10)
                }
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ZStack {
        Color.darkblue50.ignoresSafeArea()
        DiscussionDetailView(image: events[0].image, title: events[0].name, messages: events[0].eventMessages)
    }
}
