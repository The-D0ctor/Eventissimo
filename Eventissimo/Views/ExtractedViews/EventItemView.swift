//
//  EventItemView.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 07/03/2025.
//

import SwiftUI

struct EventItemView: View {
    var event: Event
    
    var body: some View {
        Image(event.image)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 437.5)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
    }
}

#Preview {
    EventItemView(event: events[0])
}
