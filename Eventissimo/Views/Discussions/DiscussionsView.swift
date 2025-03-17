//
//  DiscussionsView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct DiscussionsView: View {
    @Environment(DataBase.self) var dataBase
    
    @State var listOptions: PickerChoiceViewModel = PickerChoiceViewModel(listChoices: ["Amis", "Évènements"])
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.darkblue900,
            .font: UIFont(name: "DM Serif Display", size: 24)!
        ]
    }
    
    var body: some View {
        @Bindable var viewModel: DiscussionsViewModel = DiscussionsViewModel(dataBase: dataBase)
        
        NavigationStack {
            ZStack {
                Color.darkblue50.ignoresSafeArea()
                VStack {
                    PickerChoices(choices: listOptions)
                    TabView(selection: $listOptions.selectedChoice) {
                        PrivateConversationsListView(dataBase: viewModel.dataBase, privateConversationsList: $viewModel.currentUserPrivateConversations)
                            .tag(0)
                        EventsDiscussionsListView(dataBase: viewModel.dataBase, eventsList: $viewModel.myEvents)
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
        .environment(DataBase())
}
