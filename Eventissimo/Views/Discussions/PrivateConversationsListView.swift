//
//  DiscussionsListView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 12/03/2025.
//

import SwiftUI

struct PrivateConversationsListView: View {
    var dataBase: DataBase
    
    @Binding var privateConversationsList: [PrivateConversation]
    
    var body: some View {
        ScrollView {
                ForEach($privateConversationsList) { $privateConversation in
                    let otherPerson = privateConversation.person1.id == dataBase.currentUser.id ? privateConversation.person2 : privateConversation.person1
                    NavigationLink {
                        MessagesListView(dataBase: dataBase, image: Image(otherPerson.profilePicture ?? ""), title: otherPerson.name, messages: $privateConversation.messages)
                    } label: {
                        DiscussionDetailView(image: Image(otherPerson.profilePicture ?? ""), title: otherPerson.name, messages: privateConversation.messages)
                    }
                }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    PrivateConversationsListView(dataBase: DataBase(), privateConversationsList: Binding.constant(newPrivateConversation))
        .environment(DataBase())
}
