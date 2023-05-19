//
//  CircleUtil.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import Foundation
struct CircleUtil {
    static func loadUserCirlce(user: User) -> UserCircle  {
        return Bundle.main.decode([UserCircle].self, from: "user_circle.json").first!
        //    return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }
//    static func loadCircleFeed(user: User) -> [Post]{
//        return [Post]()
//    }
//
//    static func loadUserFeed(user: User) -> [Post]{
//        return [Post]()
//    }
//    static func loadCircle

}
