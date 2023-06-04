//
//  UserCircle.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import Foundation
struct UserCircle: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
        case followers
        case following
        
    }
    var id = UUID()
    var followers: [User]
    var following: [User]
    
#if DEBUG
    static let example = UserCircle(followers: [User.example], following: [])
#endif
}
