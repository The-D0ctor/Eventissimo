//
//  DiscussionsListView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 12/03/2025.
//

import SwiftUI

struct DiscussionsListView: View {
    var eventsList: [Event]?
    var privateConversationsList: [PrivateConversation]?
    
    var body: some View {
        ScrollView {
            if let eventsList = eventsList {
                ForEach(eventsList) { event in
                    NavigationLink {
                        MessagesListView()
                    } label: {
                        DiscussionDetailView(image: event.image, title: event.name, messages: event.eventMessages)
                    }
                }
            } else if let privateConversationsList = privateConversationsList {
                ForEach(privateConversationsList) { privateConversation in
                    let otherPerson = privateConversation.person1.id == marion.id ? privateConversation.person2 : privateConversation.person1
                    NavigationLink {
                        MessagesListView()
                    } label: {
                        DiscussionDetailView(image: otherPerson.profilePicture ?? "", title: otherPerson.name, messages: privateConversation.messages)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    DiscussionsListView(eventsList: events)
}
