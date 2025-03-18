//
//  Events.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import SwiftUI
import SimpleCalendar

struct EventsListView: View {
    @Environment(DataBase.self) var dataBase
    
    @State var selectedDate: Date = Date.now
    /*@State var calendarEvents: [any CalendarEventRepresentable] = events.map { event in
        event.calendarEvent
    }*/
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.darkblue900,
            .font: UIFont(name: "DM Serif Display", size: 24)!
        ]
    }
    
    var body: some View {
        @Bindable var viewModel: EventListViewModel = EventListViewModel(dataBase: dataBase)
        
        NavigationStack {
            ZStack {
                Color.darkblue50.ignoresSafeArea()
                VStack(spacing: 0) {
                    GeometryReader { proxy in
                        let size = proxy.size
                        let padding = (size.width - 300) / 2
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach($viewModel.dataBase.events) { $event in
                                    NavigationLink {
                                        EventPageView(dataBase: $viewModel.dataBase, event: $event)
                                    } label: {
                                        EventsListItemView(event: event)
                                        .scrollTransition() { content, phase in
                                            content.rotationEffect(.radians(phase.value / 8), anchor: .bottom)
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
                        .safeAreaPadding(.horizontal, padding)
                        .scrollIndicators(.hidden)
                        .scrollTargetBehavior(.viewAligned)
                        .frame(height: size.height + 35)
                    }
                    .frame(height: 472.5)
                    VStack {
                        Text("Créer un\névènement")
                            .jakarta(size: 14)
                            .foregroundStyle(.green900)
                            .multilineTextAlignment(.center)
                        NavigationLink {
                            CreateEventView(dataBase: dataBase)
                        } label: {
                            LabelButtonPlusView()
                        }
                        .frame(width: 60, height: 60)
                    }
                    .padding(.bottom, 50)
                    .padding(.top, 24)
                }
            }
            .navigationTitle("Évènements")
            .navigationBarTitleDisplayMode(.inline)
            /*.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SimpleCalendarView(events: $calendarEvents, selectedDate: $selectedDate, selectionAction: .destination({ calendar in
                            EventPageView(event: events.first(where: { event in
                                event.id == UUID(uuidString: calendar.id)
                            })!)
                        })).background(Color.darkblue50)
                        }
                    label: {
                        Image("calendar")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(12)
                            .background(Color.green200)
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                }
            }*/
        }
    }
    
    nonisolated
    func offset(_ proxy: GeometryProxy) -> CGFloat {
        let progress = progress(proxy)
        
        return progress < 0 ? progress * -30 : progress * 30
    }
    
    nonisolated
    func progress(_ proxy: GeometryProxy) -> CGFloat {
        let viewWidth = proxy.size.width
        let mixX = proxy.bounds(of: .scrollView)?.minX ?? 0
        return mixX / viewWidth
    }
}

#Preview {
    EventsListView()
        .environment(DataBase())
}
