//
//  DiscussionsView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct DiscussionsView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.darkblue900,
            .font: UIFont(name: "DM Serif Display", size: 24)!
        ]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkblue50.ignoresSafeArea()
                PickerChoices(choices: PickerChoiceViewModel(listChoices: ["Amis", "Évènements"]))
            }
            .navigationTitle("Mes messages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DiscussionsView()
}
