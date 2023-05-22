//
//  Menu.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

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
struct Strain: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
        case url
        case name
    //    var photoCredit: String
    //    var price: Int
    //    var restrictions: [String]
        case description
    //    var description: String

        case image
        case terpenes
        case children
        case parents
        case aliases
        case type
    }
    var id = UUID()
    var url: String
    var name: String
//    var photoCredit: String
//    var price: Int
//    var restrictions: [String]
    var description: String
//    var description: String

    var image: String
    var terpenes: [String]
    var children: [String]
    var parents: [String]
    var aliases: [String]
    var type: String
//    var thumbnailImage: String {
//        "\(mainImage)-thumb"
//    }

//    #if DEBUG
//    static let example = MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
//    #endif
    
#if DEBUG
    static let example = Strain(id: UUID(), url:"http://leafly.com", name: "Presidential OG", description: "Presidential OG, also known as \"Presidential Kush,\" and \"Presidential OG Kush,\" is an indica-dominant hybrid marijuana strain from Royal Queen Seeds. Presidential OG is made from a cross of Bubble Gum and OG Kush that will definitely get your attention with its intense citrus and pine smell. As far as taste, it maintains the pine flavor and heads into a more earthy terrain. This strain hits hard and fast with sedative effects that make this a popular choice for those dealing with insomnia or stress. Presidential OG is 90% indica and 10% sativa.", image: "https://images.leafly.com/flower-images/defaults/generic/strain-31.png?auto=compress", terpenes: ["Myrcene", "Limonene"], children:[], parents:[], aliases: [], type: "Indica")
#endif
}
