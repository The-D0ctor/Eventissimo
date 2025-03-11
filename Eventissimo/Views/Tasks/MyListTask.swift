//
//  myListTask.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import SwiftUI

struct MyListTask: View {
    @StateObject var viewModel = TaskViewModel()
    var body: some View {
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
                                    Spacer(minLength: 25)
                                    ForEach(viewModel.myEvents) { event in
                                            VStack{
                                                    NavigationLink {
                                                        TasksView()
                                                    } label: {
                                                        HStack{
                                                            Spacer(minLength: 10)
                                                            Image(event.image)
                                                                .resizable()
                                                                .scaledToFit()
                                                                .frame(height: 50)
                                                                .mask {
                                                                    Rectangle()
                                                                        .frame(width: 35,height: 35)
                                                                        .cornerRadius(5)
                                                                }
                                                                .clipped()
                                                            
                                                            Text(event.name)
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
                                                        }
                                                
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
        }
    }
}

#Preview {
    MyListTask()
}
