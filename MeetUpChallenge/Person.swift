//
//  Person.swift
//  MeetUpChallenge
//
//  Created by Yordan Dimitrov on 14.04.24.
//

import Foundation
import SwiftUI

struct Person: Codable, Identifiable, Hashable {
    var id: UUID
    let dataImage: Data
    let name: String
    
    var swiftUiImage: Image {
        let uiImage = UIImage(data: dataImage)
        let image = Image(uiImage: uiImage ?? UIImage())
        return image
    }
    
    static var personExample = Person(id: UUID(), dataImage: Data(), name: "Petar")
}
