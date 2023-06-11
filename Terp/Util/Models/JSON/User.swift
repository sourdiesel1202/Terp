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
        case city
        case state
        case country
        case circle
        case bio
    }
    var uid = UUID()
    var id: String
    var username: String
    var firstname: String
    var lastname: String
    var image: String
    var city: String
    var state: String
    var country: String
    var circle: [String: [String]]
    var bio: String = ""
    
#if DEBUG
    static let example = User(id: "420", username: "sourdiesel", firstname: "Andrew", lastname: "Pridemore", image: "https://scontent.fosu2-2.fna.fbcdn.net/v/t39.30808-6/282559662_5459718397417862_6239982502179608476_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=SqzAjFoJQaYAX9Ah9hN&_nc_ht=scontent.fosu2-2.fna&oh=00_AfDlkpuCO9kTZUTOdF40Az_7sru7qxNB7URuHJ8BjVVpyQ&oe=647893A3", city: "Naples", state: "Florida", country: "USA", circle:["following": ["42069"], "followers":["6969"]], bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus. Sed euismod nisi porta lorem mollis. Phasellus vestibulum lorem sed risus ultricies tristique. Augue ut lectus arcu bibendum at." )
#endif
}
