//
//  Location.swift
//  MeetUpChallenge
//
//  Created by Yordan Dimitrov on 17.04.24.
//

import Foundation
import MapKit

struct Location: Codable {
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
