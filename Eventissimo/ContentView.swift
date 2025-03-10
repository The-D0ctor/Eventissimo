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
                EventsView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Événements")
                    }
                TasksView()
                    .tabItem {
                        Image(systemName: "list.bullet.clipboard")
                        Text("Tâches")
                    }
                DiscussionsView()
                    .tabItem {
                        Image(systemName: "bubble")
                        Text("Discussions")
                    }
                ProfileView(person: users[0])
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profil")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
