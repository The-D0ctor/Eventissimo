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
            dataBase.persons = await FirestoreService.shared.getUsers()
        }
    }
}
