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
        
            VStack(alignment: .leading){
                
                HStack{
                    Text("Achievements (\(self.achievements.count))").padding([.leading,.bottom]).font(.caption)
                    Spacer()
                    NavigationLink{
                        ContentView()
                    }label: {
                        Text("View All").font(.caption).padding([.bottom,.trailing])
                    }
                }
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
                            Button(action: {}){
                                VStack{
                                    Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.gray)
                                    Text("View All").font(.caption2).fontWeight(.bold).foregroundColor(.gray)
                                    
                                }
                            }.padding([.leading,.trailing])
                        }.padding([.leading,.trailing])
                    }
                
            }
        }
    }
    
    private var achievements: [Achievement]{
        return AchievementUtil.loadUserAchievements(user: self.user)!
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
