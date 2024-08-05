/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Phung Hoang Long
  ID: s3965673
  Created  date: 05/08/2024
  Last modified: 06/08/2024
  Acknowledgement: SSET-Contact-List-iOS Turorial Week 4
*/

import Foundation
import SwiftUI
import CoreLocation
import MapKit

struct Agent: Identifiable, Codable {
    var id: Int
    var name: String
    var role: String
    var background: String
    var imageName: String
    var imageSkillName: String
    var coordinates: Coordinates
    var isFavorite: Bool = false
    
    var image: Image {
        Image(imageName)
    }
    
    var skillImage: Image {
        Image(imageSkillName)
    }

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }


    init(id: Int, name: String, role: String, background: String, imageName: String, imageSkillName: String, coordinates: Coordinates, isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.role = role
        self.background = background
        self.imageName = imageName
        self.imageSkillName = imageSkillName
        self.coordinates = coordinates
        self.isFavorite = isFavorite
    }
    

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case role
        case background
        case imageName
        case imageSkillName
        case coordinates
        case isFavorite
    }
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
