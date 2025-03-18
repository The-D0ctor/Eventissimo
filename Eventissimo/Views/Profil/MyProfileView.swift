//
//  ProfileView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//


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
                            profilePicture
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 140, height: 90)
                            VStack(spacing: 4)  {
                                Text(dataBase.currentUser.name.components(separatedBy: " ").first ?? "")
                                    .jakarta(size: 18)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.darkblue700)
                                
                                if let age = dataBase.currentUser.age {
                                    Text("\(age) ans")
                                        .jakarta(size: 16)
                                        .fontWeight(.regular)
                                        .foregroundStyle(.darkblue200)
                                }
                                Text("\(dataBase.currentUser.pronouns.rawValue)")
                                    .jakarta(size: 14)
                                    .fontWeight(.light)
                                    .foregroundStyle(.darkblue200)
                            }
                        }
                        .padding(.top, 12)
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
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .frame(width: 260, height: 90)
                            HStack(spacing: 25) {
                                VStack(alignment: .center, spacing: 4)  {
                                    Text("\(viewModel.getEventsOrganized())")
                                        .serif(size: 24)
                                        .foregroundStyle(.darkblue700)
                                    Text("Évènements\norganisés")
                                        .jakarta(size: 12)
                                        .multilineTextAlignment(.center)
                                        .fontWeight(.regular)
                                        .foregroundStyle(.darkblue200)
                                }
                                Rectangle()
                                    .frame(width: 1, height: 65)
                                    .foregroundStyle(.darkblue200)
                                    .opacity(0.4)
                                
                                VStack(alignment: .center, spacing: 4)  {
                                    Text("\(viewModel.getEventsParticipated())")
                                        .serif(size: 24)
                                        .foregroundStyle(.darkblue700)
                                    Text("Évènements\nparticipés")
                                        .jakarta(size: 12)
                                        .multilineTextAlignment(.center)
                                        .fontWeight(.regular)
                                        .foregroundStyle(.darkblue200)
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
                                        EventPageView(dataBase: $viewModel.dataBase, event: $event)
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


