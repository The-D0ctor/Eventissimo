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
    var privateConversationId: String?
    
    var body: some View {
        @Bindable var viewModel: MessagesListViewModel = MessagesListViewModel(dataBase: dataBase)
        
        ZStack {
            Color.darkblue50.ignoresSafeArea()
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messages) { message in
                            if (message.person.id == dataBase.currentUser.id) {
                                MessageRightDetail(message: message)
                                    .padding(.vertical, 4)
                                    .id(message.id)
                            } else {
                                MessageLeftDetail(message: message, isEvent: isEvent)
                                    .padding(.vertical, 4)
                                    .id(message.id)
                            }
                        }
                        .padding(.vertical)
                    }
                    .onAppear(perform: {
                        if (!messages.isEmpty) {
                            proxy.scrollTo(messages.last!.id, anchor: .bottom)
                        }
                    })
                    .onChange(of: messages, { oldValue, newValue in
                        if (!newValue.isEmpty) {
                            proxy.scrollTo(newValue.last!.id, anchor: .bottom)
                        }
                    })
                }
                HStack {
                    TextField(text: $typedText) {
                        Text("Nouveau message")
                            .jakarta(size: 14)
                    }
                    .textFieldStyle(.roundedBorder)
                    Button {
                        let messageApp = MessageApp(text: typedText, date: .now, person: dataBase.currentUser)
                        messages.append(messageApp)
                        if (privateConversationId != nil) {
                            viewModel.writeMessage(privateConversationId: privateConversationId!, message: messageApp)
                        }
                        typedText = ""
                    } label: {
                        HStack {
                            //                            Text("Envoyer")
                            //                                .jakarta(size: 14)
                            Image(systemName: "paperplane")
                        }
                        .padding(12)
                        .background(.green650)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .foregroundStyle(.darkblue50)
                    }
                }
                .padding()
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
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                        Text(title)
                            .serif(size: 16)
                            .fontWeight(.medium)
                            .padding(.leading, 8)
                    }
                    .foregroundColor(.darkblue900)
                }
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
