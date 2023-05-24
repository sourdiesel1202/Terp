//
//  AchievementUtil.swift
//  Flowr
//
//  Created by Andrew on 5/16/23.
//

import Foundation
import Foundation
struct AchievementUtil{
    
    static func loadAchievements() -> [Achievement]{
        return Bundle.main.decode([Achievement].self, from: "achievement.json")
            
    }
    static func loadUserAchievements(user: User) -> [Achievement]? {
        return Bundle.main.decode([UserAchievement].self, from: "user_achievements.json").filter({$0.user==user.id}).first?.achievements
            
    }
    static func loadAchievementByName(name: String)->Achievement{
        return self.loadAchievements().filter({$0.name.lowercased()==name.lowercased()}).first!
    }
    
    static func loadAchievementDataMap()->[DataMap]{
        var _res = [DataMap]()
        self.loadAchievements().forEach(){ ach in
            _res.append(DataMap(key: ach.name, value: "", view: AchievementDetailView(achievement: ach)))
            
        }
        return _res
    }
    static func loadAchievementDataMap(achievements: [Achievement])->[DataMap]{
        var _res = [DataMap]()
        achievements.forEach(){ ach in
            _res.append(DataMap(key: ach.name, value: "", view: AchievementDetailView(achievement: ach), image: ach.image))
            
        }
        return _res
    }
}

