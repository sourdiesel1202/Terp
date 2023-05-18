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
struct Post: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
        case review
        case likes
        case comments
        
    }
    var id = UUID()
    var review: Review
    var likes: [Like]
    var comments: [Comment]
#if DEBUG
    static let example = Post(review: Review.example, likes: [Like.example], comments: [Comment.example])
#endif
}
