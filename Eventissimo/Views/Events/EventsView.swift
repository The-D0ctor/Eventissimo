//
//  Events.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct EventsView: View {
    @State private var activeID: Int?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkblue50.ignoresSafeArea()
                VStack {
                    GeometryReader { proxy in
                        let size = proxy.size
                        let padding = (size.width - 300) / 2
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(events.indices, id: \.self) { indice in
                                    EventItemView(event: events[indice])
                                        .scrollTransition() { content, phase in
                                            content.rotationEffect(.radians(phase.value / 3), anchor: .bottom)
                                                //.offset(x: 0, y: abs(phase.value) * 25)
                                    }
                                        .visualEffect { view, proxy in
                                            view.offset(y: offset(proxy))
                                        }
                                        /*.scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                            view.offset(y: phase.isIdentity && activeID == indice ? 15 : 0)
                                        }*/
                                }
                            }
                        }
                        .safeAreaPadding(.horizontal, padding)
                        .scrollIndicators(.hidden)
                        .scrollTargetBehavior(.viewAligned)
                        .scrollPosition(id: $activeID)
                        .frame(height: size.height)
                        //.offset(y: -30)
                    }
                    //.frame(height: 437.5)
                    VStack {
                        Button {
                            
                        } label: {
                            Image("plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(15)
                                .background(Color.darkblue700)
                                .clipShape(Circle())
                                .foregroundStyle(.white)
                        }
                        .frame(width: 60, height: 60)
                        Text("Créer un évènement")
                            .jakarta(size: 16)
                            .foregroundStyle(.darkblue700)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Évènements")
                        .serif(size: 24)
                        .foregroundStyle(.darkblue900)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image("calendar")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(12)
                            .background(Color.green200)
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                }
            }
        }
    }
    
    nonisolated
    func offset(_ proxy: GeometryProxy) -> CGFloat {
        let progress = progress(proxy)
        
        return progress < 0 ? progress * -437.5 : progress * 437.5
    }
    
    nonisolated
    func progress(_ proxy: GeometryProxy) -> CGFloat {
        let viewWidth = proxy.size.width
        let mixX = proxy.bounds(of: .scrollView)?.minX ?? 0
        return mixX / viewWidth
    }
}

#Preview {
    EventsView()
}
