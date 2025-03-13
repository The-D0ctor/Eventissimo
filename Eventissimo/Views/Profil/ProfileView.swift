//
//  ProfileView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

// A envoyer : ProfileView, EventCardView, données Event, données Person, assets: EventPicture et ProfilePicture

import SwiftUI

struct ProfileView: View {
    
    // 👇 Fonction pour filtrer les évènements de Marion seulement 👇 Il faudrait surement la mettre dans une View Model
    func getEventsForUser() -> [Event] {
        return events.filter { event in
            event.participants.contains { $0.person.name == users[0].name } // users[0] correspond à Marion, je ne sais pas si c'est correct et en même temps je ne savais pas comment faire autrement
        }
    }
    
    var person: Person
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(spacing: 10) {
                        if let profilePicture = person.profilePicture {
                            Image(profilePicture)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 140, height: 90)
                            VStack(spacing: 4)  {
                                Text(person.name.components(separatedBy: " ").first ?? "")
                                    .jakarta(size: 18)
                                    .fontWeight(.semibold)
                                
                                if let age = person.age {
                                    Text("\(age) ans")
                                        .jakarta(size: 16)
                                        .fontWeight(.regular)
                                }
                                Text("\(person.pronouns.rawValue)")
                                    .jakarta(size: 14)
                                    .fontWeight(.light)
                            }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green200)
                                .frame(width: 320, height: 40)
                                .opacity(0.7)
                            if let description = person.description {
                                Text("\"\(description)\"")
                                    .jakarta(size: 14)
                                    .fontWeight(.light)
                                    .foregroundColor(.darkblue700)
                            }
                        }
                        .padding(.vertical, 10)
                        HStack(spacing: 25) {
                            VStack(alignment: .center, spacing: 4)  {
                                Text("\(person.eventOrganized ?? 0)")
                                    .serif(size: 24)
                                Text("Évènements\norganisés")
                                    .jakarta(size: 14)
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.regular)
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .cornerRadius(10)
                            Rectangle()
                                .frame(width: 1, height: 90)
                                .foregroundStyle(.darkblue200)
                                .opacity(0.4)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: 140, height: 90)
                                VStack(alignment: .center, spacing: 4)  {
                                    Text("\(person.eventParticipated ?? 0)")
                                        .serif(size: 24)
                                    Text("Évènements\nparticipés")
                                        .jakarta(size: 14)
                                        .multilineTextAlignment(.center)
                                        .fontWeight(.regular)
                                }
                                .cornerRadius(10)
                            }
                        }
                        HStack {
                            Text("Derniers évènements")
                                .serif(size: 20)
                                .foregroundStyle(.green900)
                                .padding(.top, 16)
                            Spacer()
                        }
                        .padding(.horizontal, 24)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 14) {
                                ForEach(getEventsForUser(), id: \.name) { event in
                                    NavigationLink {
                                        EventPageView(event: event)
                                    } label: {
                                        EventCardView(event: event)
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                        }
                    }
                    .padding(.bottom, 24)
                }
                .onAppear(perform: {
                    UINavigationBar.appearance().titleTextAttributes = [
                        .foregroundColor: UIColor.darkblue900,
                        .font: UIFont(name: "DM Serif Display", size: 24)!
                    ]
                })
                .navigationTitle("Mon profil")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            SettingsGeneralView()
                        } label: {
                            Image(systemName: "gearshape")
                                .font(.system(size: 24))
                                .foregroundStyle(.darkblue700)
                                .padding(10)
                        }
                    }
                }
            }
            .background(Color.darkblue50)
        }
    }
}

#Preview {
    ProfileView(person: users[0])
}


