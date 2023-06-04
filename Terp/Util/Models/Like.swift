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
struct Like: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
        case user
    }
    var id = UUID()
    var user: String
    
#if DEBUG
    static let example = Like(user: "42069")
#endif
}
