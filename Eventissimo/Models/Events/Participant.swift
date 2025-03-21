//
//  Participant.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation



struct Participant: Identifiable, Equatable {
    let id: UUID = UUID()
    
    var person: Person
    var role: ERole?
}

