//
//  GuestSelectionViewModel.swift
//  Eventissimo
//
//  Created by apprenant103 on 17/03/2025.
//

import Foundation
import Observation

@Observable
class GuestSelectionViewModel: Identifiable{
    var id: UUID = UUID()
    var guests: [Person] = []
    var event: EventApp
    
    init(event: EventApp) {
        self.event = event
    }
    
    func addGuest(persons: [Person], event: EventApp) {
        for participant in persons{
            
            self.event.participants.append(Participant(person: participant, role: .guest))
        }
    
    }
}
