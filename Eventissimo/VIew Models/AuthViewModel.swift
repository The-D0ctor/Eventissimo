//
//  AuthViewModel.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 17/03/2025.
//

import Foundation
import FirebaseAuth
import FirebaseAuthUI
import FirebaseEmailAuthUI
import FirebaseGoogleAuthUI
import FirebaseOAuthUI

class AuthViewModel: NSObject, FUIAuthDelegate {
    var authUI: FUIAuth? = FUIAuth.defaultAuthUI()
    
    override init() {
        super.init()
        if let authUI = self.authUI {
            authUI.delegate = self
            let providers: [FUIAuthProvider] = [
                FUIEmailAuth(),
                FUIGoogleAuth(authUI: authUI),
                FUIOAuth.appleAuthProvider()
            ]
            authUI.providers = providers
        }
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWithAuthDataResult authDataResult: AuthDataResult?, error: Error?) {
      
    }
}
