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


struct Strains: Codable {
    var results = [StrainJSON]()
}
//
struct TerpeneJSON: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
//        case url
        case name
        case description
//        case description
        case aromas
        case effects
    //    var photoCredit: String
    //    var price: Int
    //    var restrictions: [String]
//        case description
//    //    var description: String
//
        case image
//        case terpenes
//        case children
//        case parents
//        case aliases
//        case type
    }
    var id = UUID()
//    var url: String
    var name: String
//    var photoCredit: String
//    var price: Int
//    var restrictions: [String]
//    var description: String
    var description: String

    
    var aromas: [String]
    var effects: [String]
    var image: String?
    
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
    static let example = TerpeneJSON(id: UUID(), name: "Myrcene", description: "Myrcene, also known as alpha-Myrcene and beta-Myrcene, is a monoterpene commonly found in lemongrass, hop (Humulus Lupulus), mango, verbena, bay leaves, and thyme, among others. It is the most abundant terpene in cannabis. According to a study conducted by the Swiss Federal Research Station for Agroecology and Agriculture, Myrcene contains 65% of the terpene content in a cannabis plant (Mediavilla & Steinemann, 1997). It is described as herbal or earthy and is commonly used as an intermediate by the fragrance industry to produce derivative terpenes. It is also acknowledged as a potent muscle relaxant, anti-inflammatory, pain reliever, and sedative. In the case of cannabinoids, Myrcene is believed to increase the speed of action, and the desired effects can be felt faster.", aromas: [
        "Hops",
        "Mango",
        "Lemongrass",
        "Fruity",
        "Earthy",
        "Clove",
        "Sweet Basil",
        "Basil",
        "Grassy",
        "Sweet",
        "Musty",
        "Grape"
      ], effects: [
        "Sleep-Aid",
        "Muscle Relaxant",
        "Relaxing",
        "Euphoric",
        "Analgesic",
        "Anti-Psychotic",
        "Anti-Carcinogenic",
        "Anti-Pasmodic",
        "Hypnotic",
        "Sedative",
        "Neuroprotective"
      ])
#endif
}
