//
//  AuthView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 17/03/2025.
//

import SwiftUI

struct AuthView: UIViewControllerRepresentable {
    let viewModel: AuthViewModel = AuthViewModel()
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let viewController = viewModel.authUI?.authViewController()
        
        return viewController!
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
}

#Preview {
    AuthView()
}
