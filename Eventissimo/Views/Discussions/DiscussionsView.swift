//
//  DiscussionsView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct DiscussionsView: View {
    @State var listOptions: PickerChoiceViewModel = PickerChoiceViewModel(listChoices: ["Amis", "Évènements"])
    
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
                VStack {
                    PickerChoices(choices: listOptions)
                    TabView(selection: $listOptions.selectedChoice) {
                        DiscussionsListView(privateConversationsList: newPrivateConversation.filter({ privateConversation in
                            privateConversation.person1.id == marion.id || privateConversation.person2.id == marion.id
                        }))
                            .tag(0)
                        DiscussionsListView(eventsList: events)
                            .tag(1)
                    }
                    .foregroundStyle(.darkblue900)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .padding(.top, 5)
                }.padding()
            }
            .navigationTitle("Mes messages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DiscussionsView()
}
