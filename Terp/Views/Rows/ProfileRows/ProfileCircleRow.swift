//
//  ProfileCircleRow.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileCircleRow: View {
    let user: User
    private var circle: UserCircle {
        return CircleUtil.loadUserCirlce(user: self.user)
    }
    var body: some View {
        VStack{
            Text("Circle").font(.title).fontWeight(.bold).padding(.bottom)
            RowHeaderViewAll(text: "Followers", data: UserUtil.loadUserDataMap(users: circle.followers))
            //        VStack{
            //            HStack{
            //                Text("Followers (\(self.circle.followers.count))").padding([.leading,.bottom]).font(.caption)
            //                Spacer()
            //                NavigationLink{
            //                    ContentView()
            //                }label: {
            //                    Text("View All").font(.caption).padding([.bottom,.trailing])
            //                }
            //
            //            }
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    
                    ForEach(self.circle.followers){ follower in
                        NavigationLink{
                            ProfileView(user: follower)
                        } label: {
                            
                            
                            VStack{
                                URLImage(url: follower.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).frame(maxWidth: .infinity)
                                Text(follower.username).font(.subheadline).fontWeight(.bold)
                                
                            }.padding([.leading,.trailing])
                            //                            VStack{
                            //                                URLImage(url: achievement.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).border(.gray).frame(maxWidth: .infinity)
                            //                                Text(achievement.name).font(.caption2).fontWeight(.bold)
                            //
                            //                            }.padding([.trailing, .leading])
                        }
                        
                    }
                    if self.circle.followers.count > 3{
                        Button(action: {}){
                            VStack{
                                Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.gray)
                                Text("View All").font(.caption2).fontWeight(.bold).foregroundColor(.gray)
                                
                            }
                        }.padding([.leading,.trailing])
                    }
                }.padding([.leading,.trailing,.bottom])
                //            }
            }
            ViewDivider(height: 0.5)
            RowHeaderViewAll(text: "Following", data: UserUtil.loadUserDataMap(users: self.circle.following))
            //            HStack{
            //                Text("Following (\(self.circle.following.count))").padding([.leading,.bottom]).font(.caption)
            //                Spacer()
            //                NavigationLink{
            //                    ContentView()
            //                }label: {
            //                    Text("View All").font(.caption).padding([.bottom,.trailing])
            //                }
            //
            //
            //            }
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    
                    ForEach(self.circle.following){ follower in
                        NavigationLink{
                            ProfileView(user: follower)
                        } label: {
                            VStack{
                                URLImage(url: follower.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).frame(maxWidth: .infinity)
                                Text(follower.username).font(.subheadline).fontWeight(.bold)
                                
                            }.padding([.leading,.trailing])
                            //                            VStack{
                            //                                URLImage(url: achievement.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).border(.gray).frame(maxWidth: .infinity)
                            //                                Text(achievement.name).font(.caption2).fontWeight(.bold)
                            //
                            //                            }.padding([.trailing, .leading])
                        }
                        
                    }
                    if self.circle.following.count > 3{
                        Button(action: {}){
                            VStack{
                                Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.gray)
                                Text("View All").font(.caption2).fontWeight(.bold).foregroundColor(.gray)
                                
                            }
                        }.padding([.leading,.trailing])
                    }
                }.padding([.leading,.trailing,.bottom])
            }
        }
    }
        
        
    
}

struct ProfileCircleRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCircleRow(user: User.example)
    }
}
