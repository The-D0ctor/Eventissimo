//
//  MessageListViewModel.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 19/03/2025.
//

import Foundation
import Observation

@Observable
class MessagesListViewModel {
    var dataBase: DataBase
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
    
    func writeMessage(privateConversationId: String, message: MessageApp) {
        Task {
            await FirestoreService.shared.writeMessage(privateConversationId: privateConversationId, message: message)
        }
    }
}
