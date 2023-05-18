//
//  Comment.swift
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
struct Comment: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        case post
        case user
        case description
    }
    var id = UUID()
    var user: String
    var description: String
    
#if DEBUG
    static let example = Comment(user: "123456", description: "Fuck Ricky, they can't arrest you now, you're stoned!")
#endif
}
