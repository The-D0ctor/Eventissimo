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
    
    private init() {}
    
    func getUsers() async -> [Person] {
        do {
            let documents = try await db.collection("Persons").getDocuments().documents
            var users: [Person] = []
            for document in documents {
                users.append(try document.data(as: Person.self))
            }
            print(users)
            return users
        } catch {
            print(error)
            return []
        }
    }
}
