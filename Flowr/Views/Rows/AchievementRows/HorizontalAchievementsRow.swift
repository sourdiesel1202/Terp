//
//  HorizontalAchievementsRow.swift
//  Flowr
//
//  Created by Andrew on 5/24/23.
//

import SwiftUI

struct HorizontalAchievementsRow: View {
    let achievements: [Achievement]
    var body: some View {
        VStack(alignment: .leading){
            
            
            VStack{
                ScrollView(.horizontal){
                    HStack(alignment: .top){
                        
                        ForEach(self.achievements){ achievement in
                            
                            NavigationLink {
                                AchievementDetailView(achievement: achievement)
                            }label: {
                                
                                //                                NavigationLink(destination: <#T##Destination#>, label: <#T##() -> Label#>)
                                VStack{
                                    URLImage(url: achievement.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).frame(maxWidth: .infinity)
                                    Text(achievement.name).font(.caption).fontWeight(.bold)
                                    
                                }.padding([.leading,.trailing])
                                
                            }
                        }
                        if self.achievements.count > 3{
                            Button(action: {}){
                                NavigationLink{
                                    ThumbnailListView(data: AchievementUtil.loadAchievementDataMap(achievements: self.achievements), searchTitle: "Achievements")
                                }label: {
                                    
                                
                                VStack{
                                    Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.gray)
                                    Text("View All").font(.caption2).fontWeight(.bold).foregroundColor(.gray)
                                    
                                }
                            }.padding([.leading,.trailing])}
                        }
                    }.padding([.leading,.trailing])
                }
            }.padding(.bottom)
        }
    }
}

struct HorizontalAchievementsRow_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalAchievementsRow(achievements: [Achievement.example])
    }
}
