//
//  AppDelegate.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 17/03/2025.
//

import Foundation
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        FirestoreService.shared.detachPrivateConversationsListener()
    }
}
