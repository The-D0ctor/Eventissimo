//
//  ProfileViewModel.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 17/03/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable
class ProfileViewModel {
    var dataBase: DataBase
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
    
    func getEventsForUser(user: Person) -> Binding<[EventApp]> {
        return Binding {
            self.dataBase.events.filter { event in
                event.participants.contains { $0.person.id == user.id }
            }
        } set: { newEvents in
            for newEvent in newEvents {
                if let index = self.dataBase.events.firstIndex(where: { event in
                    event.id == newEvent.id
                }) {
                    self.dataBase.events[index] = newEvent
                }
            }
        }
    }
    
    func privateMessagesWithUser(user: Person) -> Binding<[MessageApp]> {
        print("test")
        return Binding {
            if let privateConversationWithUser = self.dataBase.currentUserPrivateConversations.first(where: { privateConversation in
                privateConversation.person1.id == user.id || privateConversation.person2.id == user.id
            }) {
                return privateConversationWithUser.messages
            } else {
                return []
            }
        } set: { newMessages in
            if let index = self.dataBase.privateConversations.firstIndex(where: { privateConversation in
                (privateConversation.person1.id == user.id && privateConversation.person2.id == self.dataBase.currentUser.id) || (privateConversation.person1.id == self.dataBase.currentUser.id && privateConversation.person2.id == user.id)
            }) {
                self.dataBase.privateConversations[index].messages = newMessages
            }
            else {
                self.dataBase.privateConversations.append(PrivateConversation(messages: newMessages, person1: self.dataBase.currentUser, person2: user))
            }
        }
    }
    
    func getEventsParticipated(person: Person) -> Int {
        return dataBase.events.filter { event in
            event.participants.contains { user in
                user.person.id == person.id
            }
        }.count
    }
    
    func getEventsOrganized(person: Person) -> Int {
        return dataBase.events.filter { event in
            event.participants.contains { user in
                user.person.id == person.id && user.role == .organizer
            }
        }.count
    }
}
