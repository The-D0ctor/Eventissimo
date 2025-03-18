//
//  EventListViewModel.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 18/03/2025.
//

import Foundation
import Observation

@Observable
class EventListViewModel {
    var dataBase: DataBase
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
}
