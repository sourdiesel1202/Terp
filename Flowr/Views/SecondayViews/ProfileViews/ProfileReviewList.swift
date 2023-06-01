//
//  ProfileListView.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct ProfileReviewList: View {
//    let profiles: [User]
    let user: User
    var body: some View {
        Text("Reviews By \(self.user.username)").font(.headline).fontWeight(.bold)
        ScrollView(.vertical)
        {
            
            VStack(alignment: .leading){
                
                ForEach(PostUtil.loadPostsByUser(user: self.user)) { (post: Post) in
                    FeedRow(post: post).padding(.bottom).padding(.top)
                    ViewDivider(height: 4)
                }
            }
        }
        
    }
}

struct ProfileReviewList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileReviewList(user: User.example)
    }
}
