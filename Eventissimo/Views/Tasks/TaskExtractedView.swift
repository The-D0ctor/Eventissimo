//
//  TaskExtractedView.swift
//  Eventissimo
//
//  Created by apprenant104 on 07/03/2025.
//

import SwiftUI

struct TaskExtractedView: View {
    var body: some View {
        VStack{
            ZStack {
                Rectangle()
                    .frame(width: 302,height: 52)
                    .foregroundStyle(.green200.mix(with: .gray, by: 0.25))
                    .cornerRadius(11)
                Rectangle()
                    .frame(width: 300, height: 50)
                    .foregroundStyle(.green200)
                    .cornerRadius(10)
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(.green500.mix(with: .gray, by: 0.25))
                            .frame(width: 30, height: 30)
                            .cornerRadius(6)
                        Rectangle()
                            .fill(.white)
                            .frame(width: 28,height: 28)
                            .cornerRadius(5)
                    }
                    
//                    .offset(x:-65)
                    Text("Here is a Task")
                        .foregroundStyle(.darkblue900)
                        .font(.system(size: 12))
                        .frame(width: 220,alignment: .leading)
                        .lineLimit(1)
                }
            }
        }
    }
}

#Preview {
    TaskExtractedView()
}
