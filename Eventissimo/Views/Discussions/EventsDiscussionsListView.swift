//
//  DiscussionsListView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 12/03/2025.
//

import SwiftUI

struct EventsDiscussionsListView: View {
    var dataBase: DataBase
    
    @Binding var eventsList: [EventApp]
    
    var body: some View {
        ScrollView {
                ForEach($eventsList) { $event in
                    NavigationLink {
                        MessagesListView(dataBase: dataBase, image: event.image, title: event.name, messages: $event.eventMessages, isEvent: true)
                    } label: {
                        DiscussionDetailView(image: event.image, title: event.name, messages: event.eventMessages)
                    }
                }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    EventsDiscussionsListView(dataBase: DataBase(), eventsList: Binding.constant(events))
        .environment(DataBase())
}
