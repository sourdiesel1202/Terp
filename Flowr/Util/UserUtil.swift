//
//  UserUtil.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
struct UserUtil {
    static func loadUserById(id: String) -> User?  {
        return Bundle.main.decode([User].self, from: "users.json").filter({$0.id==id}).first
        //    return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }

}
