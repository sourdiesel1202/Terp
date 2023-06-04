//
//  ProfileHeaderRpw.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileHeaderRow: View {
    let user: User
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center){
                
//                NavigationLink{} label
                if self.user.image.count == 0{
                    Image(systemName: "person.circle").resizable().scaledToFit().clipped().frame(width: 200, height: 200)
                }else{
                    URLImage(url: self.user.image, shape: AnyShape(Circle())).frame(width: 200, height: 200).scaledToFit()
                }
                
                Text(user.username).fontWeight(.bold).font(.headline)
                Text("\(user.firstname) \(user.lastname)").font(.subheadline)
                
                HStack{
                    Text("\(user.city), \(user.state) ").font(.caption)
                    Text("🇨🇦").font(.subheadline)
                }
            
                //                Text("\(user.country)").font(.subheadline)
                
//                Text("🇺🇸").font(.title)
                VStack{
                    Text("Joined 2023").font(.caption2)
                    
                    HStack{
                        Button(action: {
                            print("Follow button clicked")
                        }){
                            
                                FollowMessageButton(user: self.user, text: "Follow", action: {}).padding(.bottom)
                            
                        }
                        
                        
                        Button(action: {
                            print("Message button clicked")
                        }){
                            NavigationLink{
                                MessagesRow(messageThread: MessageUtil.loadMessageThreadByUser(user: User.example, target: self.user))
                            }label:{
                                
                                FollowMessageButton(user: self.user, text: "Message", action: {}).padding(.bottom)
                            }
                        }
                        
                    }
//                    Button(action: {}){
//                        Text("Follow").font(.subheadline)
//                    }
//                    FullWidthText(text: "Follow").frame(width: 100,height: 10)
                }
                
            }
        }
    }
}

struct ProfileHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderRow(user: User.example)
    }
}
