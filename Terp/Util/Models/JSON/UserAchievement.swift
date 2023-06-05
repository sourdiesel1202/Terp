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
struct UserAchievement: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
        case user
        case achievements
        
    }
    var id = UUID()
    var user: String
    var achievements: [Achievement]
    
#if DEBUG
    static let example = UserAchievement(user: "42069", achievements: [Achievement.example]  )
#endif
}
