//
//  User.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
//
//  Like.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
import SwiftUI

//struct MenuSection: Codable, Identifiable {
//    var id: UUID
//    var name: String
//    var items: [MenuItem]
//}


//struct Strains: Codable {
//    var results = [Strain]()
//}
//
struct User: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
        case id
        case username
        case firstname
        case lastname
        case image
//        case city
//        case state
        case location
        case circle
        case bio
        case created
    }
    var uid = UUID()
    var id: String
    var username: String
    var firstname: String
    var lastname: String
    var image: String
    var location: Location
//    var city: String
//    var state: String
//    var country: String
    var circle: [String: [String]]
    var bio: String = ""
    var created: String = "04-20-2020 14:20:00"
#if DEBUG
    static let example = User(id: "420", username: "sourdiesel", firstname: "Andrew", lastname: "Pridemore", image: "", location: Location.example, circle:["following": ["42069"], "followers":["6969"]], bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus. Sed euismod nisi porta lorem mollis. Phasellus vestibulum lorem sed risus ultricies tristique. Augue ut lectus arcu bibendum at." )
#endif
}
