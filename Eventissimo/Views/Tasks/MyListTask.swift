//
//  myListTask.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import SwiftUI

struct MyListTask: View {
    //    @StateObject var viewModel = TaskViewModel()
    @State var event : [Event]
    var body: some View {
        //        ForEach(newTask, id: \.self) { task in
        //            TaskExtractedView()
        //        }
        
        NavigationStack{
            
            ZStack {
                Color.darkblue50
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    ZStack {
                        
                        VStack{
                            
                            //                    Spacer(minLength: 10)
                            Text("Liste de mes Tâches")
                                .serif(size: 24)
                                .foregroundStyle(.darkblue900)
                                .offset(y:30)
                            //                    Spacer(minLength: 575)
                            
                            VStack{
                                HStack {
                                    NavigationLink {
                                        TasksView()
                                    } label: {
                                        Spacer(minLength: 10)
                                        Image("exempleImageEvent")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 50)
                                            .mask {
                                                Rectangle()
                                                    .frame(width: 35,height: 35)
                                                    .cornerRadius(5)
                                            }
                                            .clipped()
                                        
                                        Text("Nouvel Évènement Ici")
                                            .serif(size: 16)
                                            .foregroundStyle(.darkblue900)
                                            .frame(width: 220, alignment: .leading)
                                            .lineLimit(1)
                                            .padding(.leading,10)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.green500)
                                        
                                        Spacer()
                                    }
                                    //                                    .offset(x:-30)
                                    
                                    
                                    
                                }
                                TaskExtractedView()
                                TaskExtractedView()
                            }
                            .padding()
                            .frame(width: 350)
                            .background(.white)
                            .cornerRadius(8)
                            .offset(y:30)
                            Spacer(minLength: 15)
                            
                            VStack{
                                HStack {
                                    NavigationLink {
                                        TasksView()
                                    } label: {
                                        Spacer(minLength: 10)
                                        Image("exempleImageEvent")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 50)
                                            .mask {
                                                Rectangle()
                                                    .frame(width: 35,height: 35)
                                                    .cornerRadius(5)
                                            }
                                            .clipped()
                                        
                                        Text("Nouvel Évènement Ici")
                                            .serif(size: 16)
                                            .foregroundStyle(.darkblue900)
                                            .frame(width: 220, alignment: .leading)
                                            .lineLimit(1)
                                            .padding(.leading,10)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.green500)
                                        
                                        Spacer()
                                    }
                                    //                                    .offset(x:-30)
                                    
                                    
                                    
                                }
                                TaskExtractedView()
                                TaskExtractedView()
                                TaskExtractedView()

                            }
                            .padding()
                            .frame(width: 350)
                            .background(.white)
                            .cornerRadius(8)
                            .offset(y:30)
                            Spacer(minLength: 15)
                            

                        }
                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    MyListTask(/*viewModel: TaskViewModel(),*/ event: [])
}
