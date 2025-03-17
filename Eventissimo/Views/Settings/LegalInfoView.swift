//
//  LegalInfoView.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 14/03/2025.
//

import SwiftUI

struct LegalInfoView: View {
    var body: some View {
        
        ZStack {
            Color.darkblue50.ignoresSafeArea()
            VStack {
                Text("Mentions légales")
                    .serif(size: 24)
                    .fontWeight(.bold)
                    .foregroundStyle(.darkblue700)
                    .padding(.bottom, 20)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Conditions générales d’utilisation")
                            .jakarta(size: 18)
                            .fontWeight(.bold)
                        Text("Les présentes conditions générales d'utilisation régissent l'utilisation de l'application Eventissimo. En utilisant cette application, vous acceptez ces conditions.")
                            .jakarta(size: 14)
                    }
                    Divider()
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Politique de confidentialité")
                            .jakarta(size: 18)
                            .fontWeight(.bold)
                        Text("Nous prenons votre vie privée au sérieux. Cette politique explique comment nous collectons, utilisons et protégeons vos données personnelles.")
                            .jakarta(size: 14)
                    }
                    Divider()
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Propriétaire de l'application")
                            .jakarta(size: 18)
                            .fontWeight(.bold)
                        Text("L'application Eventissimo est développée et gérée par la best team évenènementiel.")
                            .jakarta(size: 14)
                        Text("Adresse : Aux quatres coins de France")
                            .jakarta(size: 14)
                        Text("Numéro d'enregistrement : 13124425")
                            .jakarta(size: 14)
                    }
                    Divider()
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Droits des utilisateurs")
                            .jakarta(size: 18)
                            .fontWeight(.bold)
                        Text("Vous avez le droit d'accéder, de corriger, de supprimer vos données personnelles. Pour exercer vos droits, vous pouvez nous contacter à eventissimo@gmail.com.")
                            .jakarta(size: 14)
                    }
                    Divider()
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Cookies et technologies similaires")
                            .jakarta(size: 18)
                            .fontWeight(.bold)
                        Text("Nous utilisons des cookies pour améliorer votre expérience utilisateur. En utilisant l'application, vous acceptez l'utilisation des cookies.")
                            .jakarta(size: 14)
                    }
                    Divider()
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Contact")
                            .jakarta(size: 18)
                            .fontWeight(.bold)
                        Text("Si vous avez des questions concernant les mentions légales ou la politique de confidentialité, contactez-nous à eventissimo@gmail.com.")
                            .jakarta(size: 14)
                    }
                    
                    
                }
                .padding(24)
            }}
                }.foregroundStyle(.darkblue700)
          }
}

#Preview {
    LegalInfoView()
}
