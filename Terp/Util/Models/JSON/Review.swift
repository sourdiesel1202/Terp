//
//  Post.swift
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
struct Review: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
        case id
        case user
        case strain
        case rating
        case description
        case image
        case isPublic
        case isCircle
        case created
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
    var uid = UUID()
    var id: String
    var user: String
    var strain: String
    var rating: Int
    var description: String
    var image: String
    var isPublic: Bool
    var isCircle: Bool
    var created: String = "04-20-2020 14:20:00"
    
#if DEBUG
    static let example = Review(id: "1234", user: "42069", strain: "Presidential OG", rating: 5, description: "With earthy aromas and a heavy body high, Presidential OG has become one of my all time favorite strains", image: "https://images.herb.co/wp-content/uploads/2018/09/Ricky-from-Trailer-Park-Boys-is-Dreading-Canadian-Cannabis-Legalization.jpg", isPublic: false, isCircle: true)
#endif
}
