//
//  DiscoverAchievementRow.swift
//  Flowr
//
//  Created by Andrew on 5/24/23.
//

import SwiftUI

struct DiscoverAchievementRow: View {
    @State private var top10Achievements: [DataMap] = [DataMap]()
    @State private var nearAchievements: [DataMap] = [DataMap]()
    @State private var latestTerpAchievements: [DataMap] = [DataMap]()
    @State private var loading: Bool = false
    var body: some View {
        VStack{
            
        Text("Achieve Something New").padding([.top,.bottom]).fontWeight(.bold).font(.title)
            if self.loading{
                ProgressView().padding()
            }else{
                VStack{
                    RowHeaderViewAll(text: "Top 10 Achievements", data: self.top10Achievements)
                    HorizontalAchievementsRow(achievements: AchievementUtil.loadAchievements())
                    ViewDivider(height: 0.25)
                }
                VStack{
                    RowHeaderViewAll(text: "Achievements You've Almost Reached", data: self.nearAchievements)
                    HorizontalAchievementsRow(achievements: AchievementUtil.loadAchievements())
                    ViewDivider(height: 0.25)
                }
                VStack{
                    RowHeaderViewAll(text: "Newest Terp Achievements", data: self.latestTerpAchievements)
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
        
        }.onAppear{
            DispatchQueue.global(qos: .utility).async {
//                let strainData = StrainJSONUtil.loadStrains()
                let _achievements = AchievementUtil.loadAchievements()
                DispatchQueue.main.async {
                    self.loading = false
                    self.latestTerpAchievements = AchievementUtil.loadAchievementDataMap(achievements: _achievements)
                    self.nearAchievements = AchievementUtil.loadAchievementDataMap(achievements: _achievements)
                    self.top10Achievements = AchievementUtil.loadAchievementDataMap(achievements: _achievements)
//                    self.strains = strainData
//                    self.loading = false
                }
            }
        }
    }
}

struct DiscoverAchievementRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverAchievementRow()
    }
}
