//
//  CreateEvent.swift
//  Eventissimo
//
//  Created by Apprenant 42 on 07/03/2025.
//

import SwiftUI

struct CreateEventView: View {
    init() {
        // Customize the appearance of the page control (dots)
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.green500// Active dot color
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.darkblue50 // Inactive dot color

    }
    @State var selectedTab = 0
    var body: some View {
        Text("Créer un Événement")
            .jakarta(size: 30)
            .padding(.top, 60)
        
        TabView (selection: $selectedTab){
            
            NameEventQuestion(selectedTab : $selectedTab)
                .tag(0)
            PictureQuestion(selectedTab : $selectedTab)
                .tag(1)
            WhenWhereQuestion(selectedTab : $selectedTab)
                .tag(2)
            TeamQuestion(selectedTab : $selectedTab)
                .tag(3)
            
            
        }.tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))

        
    }
}

#Preview {
    CreateEventView()
}


//ScrollView(.horizontal, showsIndicators: false) {
//    HStack(spacing: 16) {
//        ForEach(0 ..< 5) { item in
//            GeometryReader { geometry in
//                ZStack {
//                    RoundedRectangle(cornerRadius: 30)
//                        .frame(width: 300, height: 300)
//                        .foregroundStyle(.purple)
//                        .rotation3DEffect(
//                            Angle(
//                                degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
//                            ),
//                            axis: (x: 0, y: 1, z: 0),
//                            anchor: .center,
//                            anchorZ: 0.0,
//                            perspective: 1.0
//                        )
//                    VStack {
//                        Text("Hello, World!")
//                        Text("Hello, World!")
//                        Text("Hello, World!")
//                        Text("Hello, World!")
//                    }
//                }
//            }.frame(width:300, height:300)
//        }
//    }
//    .padding()
//}
