//
//  taskListSwiftData.swift
//  Eventissimo
//
//  Created by apprenant104 on 11/03/2025.
//

import Foundation
import SwiftData

@Model
class ValitatedTask{
    var isCompleted: Bool
    
    init(isCompleted: Bool) {
        self.isCompleted = isCompleted
    }
}
