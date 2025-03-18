//
//  MyProfileViewModel.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 14/03/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable
class MyProfileViewModel {
    var dataBase: DataBase
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
    
    func getEventsForUser() -> Binding<[EventApp]> {
        return Binding {
            self.dataBase.events.filter { event in
                event.participants.contains { $0.person.id == self.dataBase.currentUser.id }
            }
        } set: { newEvents in
            for newEvent in newEvents {
                if let index = self.dataBase.events.firstIndex(where: { event in
                    event.id == newEvent.id
                }) {
                    self.dataBase.events[index] = newEvent
                }
            }
        }
    }
    
    func getEventsParticipated() -> Int {
        return dataBase.events.filter { event in
            event.participants.contains { user in
                user.person.id == self.dataBase.currentUser.id
            }
        }.count
    }
    
    func getEventsOrganized() -> Int {
        return dataBase.events.filter { event in
            event.participants.contains { user in
                user.person.id == self.dataBase.currentUser.id && user.role == .organizer
            }
        }.count
    }
}
