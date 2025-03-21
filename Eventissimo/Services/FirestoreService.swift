//
//  FirestoreService.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 18/03/2025.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirestoreService {
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    var privateConversationsListener: ListenerRegistration?
    
    private init() {}
    
    func getUsers() async -> [Person] {
        do {
            let documents = try await db.collection("Persons").getDocuments().documents
            var users: [Person] = []
            for document in documents {
                let user = try document.data(as: Person.self)
                users.append(user)
            }
            return users
        } catch {
            print(error)
            return []
        }
    }
    
    func getUser(id: String) async -> Person? {
        do {
            return try await db.collection("Persons").document(id).getDocument(as: Person.self)
        } catch {
            print(error)
            return nil
        }
    }
    
    func getUserByRef(ref: String) async -> Person? {
        do {
            return try await db.document(ref).getDocument(as: Person.self)
        } catch {
            print(error)
            return nil
        }
    }
    
    func getMessages() async -> [MessageApp] {
        do {
            let documents = try await db.collection("MessageApps").getDocuments().documents
            var messages: [MessageApp] = []
            for document in documents {
                var message = try document.data(as: MessageApp.self)
                if let personRef = message.personRef {
                    message.person = try await db.document(personRef).getDocument(as: Person.self)
                }
                messages.append(try document.data(as: MessageApp.self))
            }
            return messages
        } catch {
            print(error)
            return []
        }
    }
    
    func getMessagesForUser(userId: String) async -> [MessageApp] {
        do {
            let documents = try await db.collection("MessageApps").whereField("personRef", isEqualTo: "Persons/\(userId)").getDocuments().documents
            var messages: [MessageApp] = []
            for document in documents {
                var message = try document.data(as: MessageApp.self)
                if let personRef = message.personRef {
                    message.person = try await db.document(personRef).getDocument(as: Person.self)
                }
                messages.append(try document.data(as: MessageApp.self))
            }
            return messages
        } catch {
            print(error)
            return []
        }
    }
    
    func getPrivateConversationsForUser(userId: String) async -> [PrivateConversation] {
        do {
            let documents = try await db.collection("PrivateConversations").whereFilter(.orFilter([.whereField("person1Ref", isEqualTo: "Persons/\(userId)"), .whereField("person2Ref", isEqualTo: "Persons/\(userId)")])).getDocuments().documents
            var privateConversations: [PrivateConversation] = []
            for document in documents {
                var privateConversation = try document.data(as: PrivateConversation.self)
                privateConversation.person1 = await getUserByRef(ref: privateConversation.person1Ref!)!
                privateConversation.person2 = await getUserByRef(ref: privateConversation.person2Ref!)!
                privateConversation.messages = await getMessagesByRef(refs: privateConversation.messagesRefs)
                privateConversations.append(privateConversation)
            }
            return privateConversations
        } catch {
            print(error)
            return []
        }
    }
    
    func listenToPrivateConversationsForUser(userId: String, listener: @escaping ([PrivateConversation]) -> Void) {
        privateConversationsListener = db.collection("PrivateConversations").whereFilter(.orFilter([.whereField("person1Ref", isEqualTo: "Persons/\(userId)"), .whereField("person2Ref", isEqualTo: "Persons/\(userId)")])).addSnapshotListener { querySnapshot, error in
            if let error = error {
                print(error)
                listener([])
            } else if let snapshot = querySnapshot {
                let documents = snapshot.documents
                Task {
                    var privateConversations: [PrivateConversation] = []
                    for document in documents {
                        var privateConversation = try document.data(as: PrivateConversation.self)
                        privateConversation.person1 = await self.getUserByRef(ref: privateConversation.person1Ref!)!
                        privateConversation.person2 = await self.getUserByRef(ref: privateConversation.person2Ref!)!
                        privateConversation.messages = await self.getMessagesByRef(refs: privateConversation.messagesRefs)
                        privateConversations.append(privateConversation)
                    }
                    listener(privateConversations)
                }
            }
        }
    }
    
    func writePrivateConversations(privateConversations: [PrivateConversation]) async {
        do {
            for privateConversation in privateConversations {
                try db.collection("PrivateConversations").document(privateConversation.id).setData(from: privateConversation)
            }
        } catch {
            print(error)
        }
    }
    
    func writePrivateConversation(privateConversation: PrivateConversation) async {
        do {
            var privateConversation = privateConversation
            privateConversation.person1Ref = "Persons/\(privateConversation.person1.id)"
            privateConversation.person2Ref = "Persons/\(privateConversation.person2.id)"
            var messagesRefs: [String] = []
            for message in privateConversation.messages {
                messagesRefs.append("MessageApps/\(message.id)")
            }
            
            try db.collection("PrivateConversations").document(privateConversation.id).setData(from: privateConversation)
        } catch {
            print(error)
        }
    }
    
    func writeMessage(privateConversationId: String, message: MessageApp) async {
        do {
            var message = message
            message.personRef = "Persons/\(message.person.id)"
            try db.collection("MessageApps").document(message.id).setData(from: message)
            let privateConversationDoc = db.collection("PrivateConversations").document(privateConversationId)
            var privateConversation = try await privateConversationDoc.getDocument(as: PrivateConversation.self)
            privateConversation.messages.append(message)
            privateConversation.messagesRefs.append("MessageApps/\(message.id)")
            try privateConversationDoc.setData(from: privateConversation)
        } catch {
            print(error)
        }
    }
    
    func detachPrivateConversationsListener() {
        privateConversationsListener?.remove()
    }
    
    func getMessagesByRef(refs: [String]) async -> [MessageApp] {
        do {
            var messages: [MessageApp] = []
            for ref in refs {
                var message = try await db.document(ref).getDocument(as: MessageApp.self)
                message.person = await getUserByRef(ref: message.personRef!)!
                messages.append(message)
            }
            return messages
            
        } catch {
            print(error)
            return []
        }
    }
    
    func getMessagesWithIds(messageIds: [String]) async -> [MessageApp] {
        do {
            let documents = try await db.collection("MessageApps").whereField("id", in: messageIds).getDocuments().documents
            var messages: [MessageApp] = []
            for document in documents {
                var message = try document.data(as: MessageApp.self)
                message.person = await getUserByRef(ref: message.personRef!)!
                messages.append(message)
            }
            return messages
            
        } catch {
            print(error)
            return []
        }
    }
}
