//
//  ProfileView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    var dataBase: DataBase
    
    var person: Person
    
    var body: some View {
        @Bindable var viewModel: ProfileViewModel = ProfileViewModel(dataBase: dataBase)
        
        VStack {
            ScrollView {
                if let profilePicture = person.profilePicture {
                   profilePicture
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                    HStack(spacing: 36) {
                        Image(systemName: "bubble.left.and.bubble.right")
                            .font(.system(size: 14))
                            .frame(width: 40, height: 40)
                            .opacity(0)
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
                                        .foregroundStyle(.darkblue200)
                                }
                                Text("\(person.pronouns.rawValue)")
                                    .jakarta(size: 14)
                                    .fontWeight(.light)
                                    .foregroundStyle(.darkblue200)
                            }
                        }
                        if (person.id != dataBase.currentUser.id) {
                            NavigationLink {
                                MessagesListView(dataBase: dataBase, image: (person.profilePicture ?? Image("")), title: person.name, messages: viewModel.privateMessagesWithUser(user: person), isEvent: true)
                            } label: {
                                VStack {
                                    Image(systemName: "bubble.left.and.bubble.right")
                                        .font(.system(size: 14))
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(.green650))
                                    Text("Message")
                                        .jakarta(size: 12)
                                        .foregroundStyle(.darkblue200)
                                        .fontWeight(.regular)
                                }
                            }
                            .padding(.top, 16)
                        }
                        else {
                            Spacer().frame(maxWidth: 40)
                        }
                    }
                    ZStack {
                        if let description = person.description {
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
                    }
                    .padding(.vertical, 10)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .frame(width: 260, height: 90)
                        HStack(spacing: 25) {
                            VStack(alignment: .center, spacing: 4)  {
                                Text("\(viewModel.getEventsOrganized(person: person))")
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
                                Text("\(viewModel.getEventsParticipated(person: person))")
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
                            ForEach(viewModel.getEventsForUser(user: person)) { $event in
                                NavigationLink {
                                    EventPageView(dataBase: $viewModel.dataBase, event: $event)
                                } label: {
                                    EventCardView(event: event)
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                    }.padding(.bottom, 24)
                }
            }
            .onAppear(perform: {
                UINavigationBar.appearance().titleTextAttributes = [
                    .foregroundColor: UIColor.darkblue900,
                    .font: UIFont(name: "DM Serif Display", size: 24)!]
            })
        }
        .background(Color.darkblue50)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24))
                        .foregroundStyle(.darkblue700)
                        .padding(24)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(dataBase: DataBase(), person: camille)
    }
}


