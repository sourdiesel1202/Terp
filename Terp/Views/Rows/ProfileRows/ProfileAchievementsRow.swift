//
//  ProfileAchievementRow.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileAchievemenstRow: View {
    let user: User
    var body: some View {
        VStack{
            Text("Acheievements").font(.title).fontWeight(.bold).padding(.bottom)
            VStack(alignment: .leading){
                
                RowHeaderViewAll(text: "Achievements (\(self.achievements.count))", data: AchievementUtil.loadAchievementDataMap(achievements: AchievementUtil.loadUserAchievements(user: self.user)))
                HorizontalAchievementsRow(achievements: AchievementUtil.loadUserAchievements(user: self.user))
                
            }
        }
    }
    
    private var achievements: [Achievement]{
        return AchievementUtil.loadUserAchievements(user: self.user)
//        var _res = [Achievement]()
//        AchievementUtil.loadUserAchievements(user: self.user).forEach(){ ach in
//            _res.append(AchievementUtil.loadAchievementByName(name: ach ))
//        }
//        return _res
    }
}

struct ProfileAchievementsRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAchievemenstRow(user: User.example)
    }
}
