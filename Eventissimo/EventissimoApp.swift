//
//  EventissimoApp.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

@main
struct EventissimoApp: App {
    private var dataBase = DataBase()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataBase)
        }
    }
}
