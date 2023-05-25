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
    
    static func loadUserDataMap(users: [String])->[DataMap]{
        var _res = [DataMap]()
        users.forEach(){ userId in
            let user = self.loadUserById(id: userId)
            if !_res.contains(where: {$0.key == user?.username}){
                _res.append(DataMap(key: user!.username, value: user!.country, view: ProfileView(user: user!), image: user!.image))
            }
        }
        return _res
    }
    
    static func loadUserDataMap(users: [User])->[DataMap]{
        var _res = [DataMap]()
        users.forEach(){ user in
//            var user = self.loadUserById(id: userId)
            if !_res.contains(where: {$0.key == user.username}){
                _res.append(DataMap(key: user.username, value: user.country, view: ProfileView(user: user), image: user.image))
            }
        }
        return _res
    }

}
