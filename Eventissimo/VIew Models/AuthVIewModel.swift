//
//  AuthVIewModel.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 18/03/2025.
//

import Foundation

class AuthViewModel {
    var dataBase: DataBase
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
    
    func getUsers() {
        Task {
            dataBase.persons = await FirestoreService.shared.getUsers().sorted { $0.name < $1.name }
        }
    }
    
    func getPrivateConversationsForUser(userId: String) {
        FirestoreService.shared.listenToPrivateConversationsForUser(userId: userId) { privateConversations in
            self.dataBase.privateConversations = privateConversations.sorted {
                let otherPerson0 = $0.person1.id == userId ? $0.person2 : $0.person1
                let otherPerson1 = $1.person1.id == userId ? $1.person2 : $1.person1
                return otherPerson0.name < otherPerson1.name
            }
        }
    }
}
