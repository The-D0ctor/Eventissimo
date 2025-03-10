//
//  Participant.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation



struct Participant {
    let person: Person
    let role: ERole
}

var newParticipant: [Participant] = [
    Participant(person: newPerson[0],
                role: .organizer)
]

