//
//  AchievementHeaderRow.swift
//  Terp
//
//  Created by Andrew on 6/13/23.
//

import SwiftUI

struct AchievementHeaderRow: View {
    let achievement: Achievement
    var body: some View {
//        Image(systemName: "atom").resizable().scaledToFill()
        VStack{
            URLImage(url: achievement.image, shape: AnyShape(Rectangle())).scaledToFit()
            Text(achievement.name).font(.largeTitle).padding(.bottom).fontWeight(.bold)
            Text("Info").font(.title).fontWeight(.bold)
            Text(achievement.description).font(.subheadline)
        }
    }
}

struct AchievementHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        AchievementHeaderRow(achievement: Achievement.example)
    }
}
