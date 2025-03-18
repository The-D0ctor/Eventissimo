//
//  Person.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation
import SwiftUI

@MainActor
struct Person: Identifiable, Equatable, Codable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var email: String
    var profilePicture: Image? {
        get {
            if let base64Data = profilePictureData, let data = Data(base64Encoded: base64Data) {
                return Image(uiImage: UIImage(data: data)!)
            }
            else if let profilePictureName = profilePictureName {
                return Image(profilePictureName)
            } else {
                return nil
            }
        }
        set(newImage) {
            if let newImage = newImage {
                self.profilePictureData = ImageRenderer(content: newImage).uiImage?.pngData()?.base64EncodedString()
            }
        }
    }
    var profilePictureName: String?
    var profilePictureData: String?
    var age: Int?
    var description: String?
    var pronouns: EPronoun
    var eventOrganized: Int? // 👉 ajout de var Evenènements organisés
    var eventParticipated: Int? // 👉 ajout de var Evenènements participations
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case email
        case age
        case description
        case pronouns
        case profilePictureData
    }
}
