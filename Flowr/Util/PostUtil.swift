//
//  PostUtil.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
struct PostUtil {
    static func loadFeed() -> [Post]  {
        return Bundle.main.decode([Post].self, from: "feed.json")
        //    return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }

}
