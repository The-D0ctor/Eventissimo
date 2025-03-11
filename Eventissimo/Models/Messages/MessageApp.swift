//
//  Message.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation

struct MessageApp: Identifiable {
    let id: UUID = UUID()
    var text: String
    var date: Date
    var person: Person
}
