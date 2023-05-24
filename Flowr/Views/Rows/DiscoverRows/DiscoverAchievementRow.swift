//
//  DiscoverAchievementRow.swift
//  Flowr
//
//  Created by Andrew on 5/24/23.
//

import SwiftUI

struct DiscoverAchievementRow: View {
    var body: some View {
        
            Text("Achieve Something New").padding([.top,.bottom]).fontWeight(.bold).font(.title)
        
            RowHeaderViewAll(text: "Top 10 Achievements")
            HorizontalAchievementsRow(achievements: AchievementUtil.loadAchievements())
            ViewDivider(height: 0.25)
            RowHeaderViewAll(text: "Achievements You've Almost Reached")
            HorizontalAchievementsRow(achievements: AchievementUtil.loadAchievements())
            ViewDivider(height: 0.25)
            RowHeaderViewAll(text: "Newest Terp Achievements")
            HorizontalAchievementsRow(achievements: AchievementUtil.loadAchievements())
            ViewDivider(height: 0.25)
        
    }
}

struct DiscoverAchievementRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverAchievementRow()
    }
}
