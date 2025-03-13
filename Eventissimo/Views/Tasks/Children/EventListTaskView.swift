//
//  EventListTasksView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct EventListTaskView: View {
    @State var tasksList: [TaskApp]
    var body: some View {
        
        ZStack {
            Color.darkblue50
                .ignoresSafeArea()
            VStack{
                Text("Titre de l'évènement ici")
                    .serif(size: 24)
                    .foregroundStyle(.darkblue900)
                
                    ForEach(tasksList){taskApp in
                                        EventListTaskExtracted(tasksList:events[0].tasks)
                                                       }
                
                
            }
        }
    }
}

#Preview {
    EventListTaskView(tasksList:events[0].tasks)
}
