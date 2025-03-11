//
//  Events.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI

struct EventsView: View {
    @State var calendarModalPresented: Bool = false
    @State var activeID: Int? = 0
    @State var selectedDate: Date = Date.now
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.darkblue900,
            .font: UIFont(name: "DM Serif Display", size: 24)!
        ]
    }
    
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
                                    NavigationLink {
                                        
                                    } label: {
                                        EventItemView(event: events[indice])
                                        .scrollTransition() { content, phase in
                                            content.rotationEffect(.radians(phase.value / 5), anchor: .bottom)
                                        }
                                        .visualEffect { view, proxy in
                                            view.offset(y: offset(proxy))
                                        }
                                    }
                                }
                            }
                            .frame(height: size.height + 35)
                            .offset(y: -35)
                            .scrollTargetLayout()
                        }
                        .scrollPosition(id: $activeID)
                        .safeAreaPadding(.horizontal, padding)
                        .scrollIndicators(.hidden)
                        .scrollTargetBehavior(.viewAligned)
                        .frame(height: size.height + 35)
                    }
                    .frame(height: 472.5)
                    VStack {
                        NavigationLink {
                            
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
                    .padding(.bottom, 50)
                }
            }
            .navigationTitle("Évènements")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if (activeID != nil) {
                            selectedDate = events[activeID!].date
                            calendarModalPresented.toggle()
                        }
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
            .sheet(isPresented: $calendarModalPresented) {
                DatePicker(selection: $selectedDate, in: selectedDate...selectedDate, displayedComponents: .date, label: {
                    
                })
                .datePickerStyle(.graphical)
                //.disabled(true)
                .presentationDetents([.fraction(0.6)])
            }
        }
    }
    
    nonisolated
    func offset(_ proxy: GeometryProxy) -> CGFloat {
        let progress = progress(proxy)
        
        return progress < 0 ? progress * -50 : progress * 50
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
