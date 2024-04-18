//
//  Person.swift
//  MeetUpChallenge
//
//  Created by Yordan Dimitrov on 14.04.24.
//

import Foundation
import SwiftUI

struct Person: Codable, Identifiable, Hashable, Comparable {
    
    
    var id: UUID
    let dataImage: Data
    let name: String
    let location: Location
    
    var swiftUiImage: Image {
        let uiImage = UIImage(data: dataImage)
        let image = Image(uiImage: uiImage ?? UIImage())
        return image
    }
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static var personExample = Person(id: UUID(), dataImage: Data(), name: "Petar", location: Location(latitude: 48.7758, longitude: 9.1829))
}
