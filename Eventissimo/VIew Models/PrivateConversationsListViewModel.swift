//
//  PrivateConversationListViewModel.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 19/03/2025.
//

import Foundation
import Observation

@Observable
class PrivateConversationsListViewModel {
    var dataBase: DataBase
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
    
    /*func writePrivateConversations(privateConversations: [PrivateConversation]) {
        Task {
            await FirestoreService.shared.writePrivateConversations(privateConversations: privateConversations)
        }
    }*/
}
