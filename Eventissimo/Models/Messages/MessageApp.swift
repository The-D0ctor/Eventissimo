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

var newMessageApp : [MessageApp] = [
    MessageApp(text: "Ready to party??",
               date: .now,
               person: newPerson[0]),
    MessageApp(text: "So ready! You better be prepared!",
               date: .now,
               person: newPerson[1])
]
