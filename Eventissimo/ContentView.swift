//
//  ContentView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            TabView {
                EventsListView()
                    .tabItem {
                        Image("calendar")
                        Text("Événements")
                    }
                MyListTaskView()
                    .tabItem {
                        Image("tasks")
                        Text("Tâches")
                    }
                DiscussionsView()
                    .tabItem {
                        Image("discussions")
                        Text("Discussions")
                    }
                ProfileView(person: users[0])
                    .tabItem {
                        Image("profile")
                        Text("Profil")
                    }
            }
            .tint(.green700)
        }
    }
}

#Preview {
    ContentView()
}
