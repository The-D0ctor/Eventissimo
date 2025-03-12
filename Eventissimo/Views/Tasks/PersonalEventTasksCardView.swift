//
//  PersonalEventTasksCardView.swift
//  Eventissimo
//
//


import SwiftUI

struct PersonalEventTasksCardView: View {
    var event: Event
    var tasksList: [TaskApp]
    var body: some View {
        VStack{
            NavigationLink {
                TasksView()
            } label: {
                HStack{
                    Image(event.image)
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
            }
            PersonalTasksListView(tasksList: tasksList)
        }
        .padding()
        .background(.white)
        .cornerRadius(8)
    }
}

#Preview {
    PersonalEventTasksCardView(event: events[0], tasksList: events[0].tasks)
}
