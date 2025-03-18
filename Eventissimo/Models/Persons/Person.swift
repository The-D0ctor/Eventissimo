//
//  Person.swift
//  Eventissimo
//
//  Created by Sébastien Rochelet on 05/03/2025.
//

import Foundation
import SwiftUI


struct Person: Identifiable, Equatable, Codable {
    var id: UUID = UUID()
    var name: String
    var email: String
    var profilePicture: Image?/* {
        get {
            if let base64Data = profilePictureData, let data = Data(base64Encoded: base64Data) {
                Image(uiImage: UIImage(data: data)!)
            }
            else {
                return nil
            }
        }
        set {
            
        }
    }*/
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
