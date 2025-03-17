//
//  ProfileView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

// A envoyer : ProfileView, EventCardView, données Event, données Person, assets: EventPicture et ProfilePicture

import SwiftUI

struct MyProfileView: View {
    @Environment(DataBase.self) var dataBase
        
    var body: some View {
        @Bindable var viewModel: MyProfileViewModel = MyProfileViewModel(dataBase: dataBase)
        
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(spacing: 10) {
                        if let profilePicture = dataBase.currentUser.profilePicture {
                            Image(profilePicture)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 140, height: 90)
                            VStack(spacing: 4)  {
                                Text(dataBase.currentUser.name.components(separatedBy: " ").first ?? "")
                                    .jakarta(size: 18)
                                    .fontWeight(.semibold)
                                
                                if let age = dataBase.currentUser.age {
                                    Text("\(age) ans")
                                        .jakarta(size: 16)
                                        .fontWeight(.regular)
                                }
                                Text("\(dataBase.currentUser.pronouns.rawValue)")
                                    .jakarta(size: 14)
                                    .fontWeight(.light)
                            }
                        }
                        if let description = dataBase.currentUser.description {
                            Text("\"\(description)\"")
                                .jakarta(size: 14)
                                .fontWeight(.light)
                                .foregroundColor(.darkblue700)
                                .padding(.top, 18)
                                .padding([.bottom, .horizontal], 12)
                                .background {
                                    SpeechBubbleLeft()
                                        .foregroundStyle(.green200)
                                }
                                .padding(.vertical, 10)
                        }
                        HStack(spacing: 25) {
                            VStack(alignment: .center, spacing: 4)  {
                                Text("\(dataBase.currentUser.eventOrganized ?? 0)")
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
                            Divider()
                                .frame(width: 1, height: 80)
                                .overlay(.darkblue400)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: 140, height: 90)
                                VStack(alignment: .center, spacing: 4)  {
                                    Text("\(dataBase.currentUser.eventParticipated ?? 0)")
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
                                ForEach(viewModel.getEventsForUser()) { $event in
                                    NavigationLink {
                                        EventPageView(dataBase: viewModel.dataBase, event: $event)
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
    MyProfileView()
        .environment(DataBase())
}


