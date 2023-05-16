//
//  TerpeneProfile.swift
//  Flowr
//
//  Created by Andrew on 5/15/23.
//

import Foundation

import SwiftUI

//struct MenuSection: Codable, Identifiable {
//    var id: UUID
//    var name: String
//    var items: [MenuItem]
//}


//
struct TerpeneProfile: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
//        case url
        case terpenes
        case aromas
        case effects
    //    var photoCredit: String
    //    var price: Int
    //    var restrictions: [String]
//        case description
//    //    var description: String
//
//        case image
//        case terpenes
//        case children
//        case parents
//        case aliases
//        case type
    }
    var id = UUID()
    var terpenes: [String]
    var aromas: [String]
    var effects: [String]
    
//    var children: [String]
//    var parents: [String]
//    var aliases: [String]
//    var type: String
//    var thumbnailImage: String {
//        "\(mainImage)-thumb"
//    }

//    #if DEBUG
//    static let example = MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
//    #endif
    
#if DEBUG
    static let example = TerpeneProfile(terpenes: ["Myrcene"], aromas: ["Diesel"], effects: ["Sedative"])
#endif
}
