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
struct Achievement: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
//        case url
        case name
        case description
        case image
//        case description
        case strains
        case requires
    
    }
    var id = UUID()
//    var url: String
    var name: String
//    var photoCredit: String
//    var price: Int
//    var restrictions: [String]
//    var description: String
    var description: String

    var image: String
    var strains: [String]
    var requires: Int
    
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
    static let example = Achievement(name: "Cake by the Pound", description: "The Cake by the Pound achievement can be earned by rating 3 cake stains", image: "https://external-preview.redd.it/yAvFGhUWDGAg_t93u6UtvXgk2SDMwPEUr9QX3T1mFto.jpg?auto=webp&s=c4fa72e3d795dc32e53e11e3d9f1ac8921272c59", strains: ["London Pound Cake","Wedding Cake", "LA Kush Cake", "Divorce Cake", "Birthday Cake"], requires: 3)
#endif
}
