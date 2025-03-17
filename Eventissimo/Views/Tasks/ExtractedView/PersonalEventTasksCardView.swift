//
//  PersonalEventTasksCardView.swift
//  Eventissimo
//
//


import SwiftUI

struct PersonalEventTasksCardView: View {
    @Binding var dataBase: DataBase
    @Binding var event: EventApp
    @Binding var tasksList: [TaskApp]
    @State var currentIndex : Int = 2

    var body: some View {
        VStack{
            NavigationLink {
                EventListTaskView(dataBase:$dataBase, currentIndex: $currentIndex)
            } label: {
                HStack{
                    event.image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .cornerRadius(8)
                        .clipped()
                    Text(event.name)
                        .serif(size: 16)
                        .foregroundStyle(.darkblue900)
                        .lineLimit(1)
                        .padding(.leading,10)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.green500)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    if let eventIndex = dataBase.events.firstIndex(where: { $0.id == event.id }) {
                                    currentIndex = eventIndex
                                }
                            })
            }
            PersonalTasksListView(tasksList: $tasksList)
        }
        .padding()
        .background(.white)
        .cornerRadius(8)
    }
}

#Preview {
    PersonalEventTasksCardView(dataBase: Binding.constant(DataBase()), event: Binding.constant(events[0]), tasksList: Binding.constant(events[0].tasks))
}
