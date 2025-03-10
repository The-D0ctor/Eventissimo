//
//  privateConversation.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation

struct PrivateConversation: Identifiable {
    let id: UUID = UUID()
    
    var messages: [MessageApp] = []
    var person: Person
}

var newPrivateConversation : [PrivateConversation] = [
    PrivateConversation(messages: newMessageApp,
                        person:newPerson[0])
]
