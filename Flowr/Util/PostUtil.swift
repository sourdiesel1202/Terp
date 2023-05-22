//
//  PostUtil.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
struct PostUtil {
    static func loadPublicFeed() -> [Post]  {
        return Bundle.main.decode([Post].self, from: "feed.json")
        //    return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }
    static func loadCircleFeed(user: User) -> [Post]{
        return [Post]()
    }
    
    static func loadPublicUserFeed(user: User) -> [Post]{
        return Bundle.main.decode([Post].self, from: "feed.json").filter({$0.review.user==user.id && $0.review.isPublic})
    }
    static func loadPublicStrainFeed(strain: Strain) -> [Post]{
        return Bundle.main.decode([Post].self, from: "feed.json").filter({$0.review.strain==strain.name && $0.review.isPublic})
    }
    
//    static func loadPublicPostsByUser(user: User) -> [Post]{
//
//    }
//    static func loadCircle

}
