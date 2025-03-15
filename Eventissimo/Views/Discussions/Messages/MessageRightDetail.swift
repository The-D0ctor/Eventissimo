//
//  MessageRightDetail.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 13/03/2025.
//

import SwiftUI

struct MessageRightDetail: View {
    var message: MessageApp
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                Text(message.text)
                    .jakarta(size: 12)
                    .foregroundStyle(.darkblue900)
                    .padding(.vertical, 5)
                Text(dateFormatter.string(from: message.date))
                    .jakarta(size: 8)
                    .foregroundStyle(.darkblue400)
                    .fontWeight(.light)
            }
            .padding(8)
            .background {
                SpeechBubbleRight()
                    .foregroundStyle(.green500)
            }
        }
        .padding(.trailing, 20)
    }
}

#Preview {
    MessageRightDetail(message: events[0].eventMessages[0])
}
