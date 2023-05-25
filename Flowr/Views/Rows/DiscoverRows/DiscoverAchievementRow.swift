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
        VStack{
            RowHeaderViewAll(text: "Top 10 Achievements", data: AchievementUtil.loadAchievementDataMap())
            HorizontalAchievementsRow(achievements: AchievementUtil.loadAchievements())
            ViewDivider(height: 0.25)
        }
        VStack{
            RowHeaderViewAll(text: "Achievements You've Almost Reached", data: AchievementUtil.loadAchievementDataMap())
            HorizontalAchievementsRow(achievements: AchievementUtil.loadAchievements())
            ViewDivider(height: 0.25)
        }
        VStack{
            RowHeaderViewAll(text: "Newest Terp Achievements", data: AchievementUtil.loadAchievementDataMap())
            HorizontalAchievementsRow(achievements: AchievementUtil.loadAchievements())
            ViewDivider(height: 0.25)
            NavigationLink{
                ThumbnailListView(data: AchievementUtil.loadAchievementDataMap(), searchTitle: "All Achievements")
                //            ThumbnailListView(data: AchievementUtil.loadAchievementDataMap(),searchTitle: "All Achievements")
            }label: {
                FullWidthText(text: "View All Achievements").padding()
            }
        }
    }
}

struct DiscoverAchievementRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverAchievementRow()
    }
}
