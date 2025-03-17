//
//  DiscussionsViewModel.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 14/03/2025.
//

import Foundation
import Observation

@Observable
class DiscussionsViewModel {
    var dataBase: DataBase
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
    
    var currentUserPrivateConversations: [PrivateConversation] {
        get {
            return dataBase.privateConversations.filter({ privateConversation in
                privateConversation.person1.id == dataBase.currentUser.id || privateConversation.person2.id == dataBase.currentUser.id
            })
        }
        
        set(newPrivateConversations) {
            for newPrivateConversation in newPrivateConversations {
                if let index = dataBase.privateConversations.firstIndex(where: { privateConversation in
                    (privateConversation.person1.id == newPrivateConversation.person1.id && privateConversation.person2.id == newPrivateConversation.person2.id) || (privateConversation.person1.id == newPrivateConversation.person2.id && privateConversation.person2.id == newPrivateConversation.person1.id)
                }) {
                    dataBase.privateConversations[index] = newPrivateConversation
                }
            }
        }
    }
    
    var myEvents: [EventApp] {
        get {
            dataBase.events.filter { event in
                event.participants.contains { $0.person.id == dataBase.currentUser.id }
            }
        }
        set(newEvents) {
            for newEvent in newEvents {
                if let eventIndex = dataBase.events.firstIndex(where: { event in
                    event.id == newEvent.id
                }) {
                    dataBase.events[eventIndex] = newEvent
                }
            }
        }
    }
}
