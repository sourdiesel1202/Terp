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
        case id
        case user
        case description
        case replies
    }
    var uuid = UUID()
    var id: String
    var user: String
    var description: String
    var replies: [Comment]?
    
#if DEBUG
    static let example = Comment(id: "1234",user: User.example.id, description: "Fuck Ricky, they can't arrest you now, you're stoned!")
#endif
}
