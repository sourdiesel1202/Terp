//
//  AchievementRequirementsRow.swift
//  Terp
//
//  Created by Andrew on 6/13/23.
//

import SwiftUI

struct AchievementRequirementsRow: View {
    let achievement: Achievement
    @State private var user: User = User.example
    var body: some View {
        
        VStack{
            Text("Requirements").font(.title).fontWeight(.bold)
            Text("Requires").font(.headline).fontWeight(.bold)
            Text("\(achievement.requires) Ratings").font(.title).padding(.bottom)
            
            Text("Completed").font(.headline).fontWeight(.bold)
            Button(action:{}){
                Text("0/\(achievement.requires)").font(.title)
            }
        }
    }
}

struct AchievementRequirementsRow_Previews: PreviewProvider {
    static var previews: some View {
        AchievementRequirementsRow(achievement: Achievement.example)
    }
}
