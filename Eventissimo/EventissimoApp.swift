//
//  EventissimoApp.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

@main
struct EventissimoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    private var dataBase = DataBase()
    
    var body: some Scene {
        WindowGroup {
            /*ContentView()
                .environment(dataBase)*/
            AuthView()
                .environment(dataBase)
        }
    }
}
