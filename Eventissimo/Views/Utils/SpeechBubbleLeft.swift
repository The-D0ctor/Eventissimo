//
//  SpeechBubble.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 29/10/2024.
//

import Foundation
import SwiftUI

struct SpeechBubbleLeft: Shape {
    private let radius: CGFloat
    private let tailSize: CGFloat

    init(radius: CGFloat = 10) {
        self.radius = radius
        tailSize = 20
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY - radius))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + tailSize + radius))
            path.addCurve(
                to: CGPoint(x: rect.minX, y: rect.minY + radius),
                control1: CGPoint(x: rect.minX - radius, y: rect.minY + radius),
                control2: CGPoint(x: rect.minX - tailSize - radius, y: rect.minY + radius)
            )
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.minY + 2 * radius),
                radius: radius,
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
        }
    }
}

#Preview {
    SpeechBubbleLeft()
        .stroke(Color.gray, lineWidth: 3)
        .frame(width: 200, height: 100)
}

