//
//  AchievementDetailView.swift
//  Flowr
//
//  Created by Andrew on 5/16/23.
//

import SwiftUI

struct AchievementDetailView: View {
//    @EnvironmentObject var globalData: GlobalData
    var achievement: Achievement
    var body: some View {
        ScrollView(.vertical){
            VStack{
                AchievementHeaderRow(achievement: self.achievement).padding(.bottom)
                AchievementRequirementsRow(achievement: self.achievement).padding(.bottom)
                AchievementStrainsRow(achievement: self.achievement).padding(.bottom)
                
                
                
                
            }
        }
    }
}

struct AchievementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementDetailView(achievement: Achievement(name: "Test", description: "Test", image: "https://external-preview.redd.it/yAvFGhUWDGAg_t93u6UtvXgk2SDMwPEUr9QX3T1mFto.jpg?auto=webp&s=c4fa72e3d795dc32e53e11e3d9f1ac8921272c59", strains: ["OG Kush"], requires: 3))
    }
}
