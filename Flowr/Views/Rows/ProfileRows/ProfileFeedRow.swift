//
//  ProfileFeedView.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileFeedRow: View {
    private var posts: [Post]{
        return PostUtil.loadPublicUserFeed(user: self.user)
    }
    let user: User
    var body: some View {
        VStack(alignment: .leading){
            
                HStack{
                    Text("Public Posts (\(self.posts.count))").padding([.leading,.bottom]).font(.caption)
                    Spacer()
//                    NavigationLink{
//                        ContentView()
//                    }label: {
//                        Text("View All").font(.caption).padding([.bottom,.trailing])
//                    }
                }
            
            ForEach(self.posts) { (post: Post) in
                FeedRow(post: post).padding(.bottom).padding(.top)
                ViewDivider(height: 4)
                    
                
            }
        }
    }
}

struct ProfileFeedRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFeedRow(user: User.example)
    }
}
