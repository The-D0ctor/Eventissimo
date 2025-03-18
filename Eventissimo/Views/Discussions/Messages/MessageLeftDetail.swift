//
//  MessageLeftDetail.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 13/03/2025.
//

import SwiftUI

struct MessageLeftDetail: View {
    var message: MessageApp
    var isEvent: Bool = false
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                if (isEvent) {
                    HStack {
                        (message.person.profilePicture ?? Image(""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 14, height: 14)
                            .clipShape(Circle())
                        Text(message.person.name)
                            .jakarta(size: 12)
                            .foregroundStyle(.darkblue400)
                    }.offset(x: -10)
                }
                VStack(alignment: .leading) {
                    Text(message.text)
                        .jakarta(size: 12)
                        .foregroundStyle(.darkblue900)
                        .padding(.vertical, 6)
                    Text(dateFormatter.string(from: message.date))
                        .jakarta(size: 8)
                        .foregroundStyle(.darkblue400)
                        .fontWeight(.light)
                }
                .padding(12)
                .background {
                    SpeechBubbleLeft()
                        .foregroundStyle(.grayMessages)
                }
            }
            Spacer()
        }
        .padding(.leading, 30)
    }
}

#Preview {
    MessageLeftDetail(message: events[0].eventMessages[1], isEvent: true)
}
