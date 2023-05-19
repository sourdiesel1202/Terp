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
    
#if DEBUG
    static let example = User(id: "42069", username: "whosegonnausehername", firstname: "Ricky", lastname: "LaFleur", image: "", city: "Halifax", state: "Nova Scotia", country: "Canada", circle:["following": ["6969"], "followers":["6969"]] )
#endif
}
