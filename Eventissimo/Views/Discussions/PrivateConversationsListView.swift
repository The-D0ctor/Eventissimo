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
        @Bindable var viewModel = PrivateConversationsListViewModel(dataBase: dataBase)
        
        ScrollView {
            ForEach($viewModel.dataBase.privateConversations) { $privateConversation in
                let otherPerson = privateConversation.person1.id == dataBase.currentUser.id ? privateConversation.person2 : privateConversation.person1
                NavigationLink {
                    MessagesListView(dataBase: dataBase, image: (otherPerson.profilePicture ?? Image("")), title: otherPerson.name, messages: $privateConversation.messages, privateConversationId: privateConversation.id)
                } label: {
                    DiscussionDetailView(image: (otherPerson.profilePicture ?? Image("")), title: otherPerson.name, messages: privateConversation.messages)
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        /*.onAppear {
            viewModel.getPrivateConversationsForUser(userId: dataBase.currentUser.id)
        }*/
    }
}

#Preview {
    PrivateConversationsListView(dataBase: DataBase(), privateConversationsList: Binding.constant(newPrivateConversation))
        .environment(DataBase())
}
