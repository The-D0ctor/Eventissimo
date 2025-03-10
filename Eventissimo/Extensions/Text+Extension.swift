//
//  Text+Extension.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 06/03/2025.
//

import Foundation
import SwiftUICore

extension Text {
    nonisolated
    func jakarta(size: CGFloat) -> Text {
        return self.font(.custom("Plus Jakarta Sans", size: size))
    }
    
    nonisolated
    func serif(size: CGFloat) -> Text {
        return self.font(.custom("DM Serif Display", size: size))
    }
}
