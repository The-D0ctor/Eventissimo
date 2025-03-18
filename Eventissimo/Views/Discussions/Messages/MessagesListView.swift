//
//  MessagesListView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 13/03/2025.
//

import SwiftUI

struct MessagesListView: View {
    @Environment(\.dismiss) var dismiss
    var dataBase: DataBase
    
    var image: Image?
    var title: String
    @Binding var messages: [MessageApp]
    var isEvent: Bool = false
    @State var typedText: String = ""
    
    var body: some View {
        ZStack {
            Color.darkblue50.ignoresSafeArea()
            VStack {
                ScrollView {
                    ForEach(messages) { message in
                        if (message.person.id == dataBase.currentUser.id) {
                            MessageRightDetail(message: message)
                                .padding(.vertical, 4)
                        } else {
                            MessageLeftDetail(message: message, isEvent: isEvent)
                                .padding(.vertical, 4)
                        }
                    }
                    .padding(.vertical)
                }
                HStack {
                    TextField(text: $typedText) {
                        Text("Nouveau message")
                            .jakarta(size: 14)
                    }
                    .textFieldStyle(.roundedBorder)
                    Button {
                        messages.append(MessageApp(text: typedText, date: .now, person: dataBase.currentUser))
                        typedText = ""
                    } label: {
                        HStack {
                            Text("Envoyer")
                                .jakarta(size: 14)
                            Image(systemName: "paperplane")
                        }.padding(6)
                            .background(.green650)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .foregroundStyle(.darkblue50)
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                    Text(title)
                        .jakarta(size: 16)
                        .fontWeight(.medium)
                }
                .foregroundColor(.darkblue900)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MessagesListView(dataBase: DataBase(), image: events[0].image, title: events[0].name, messages: Binding.constant(events[0].eventMessages))
            .environment(DataBase())
    }
}
