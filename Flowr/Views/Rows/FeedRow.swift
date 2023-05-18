//
//  FeedRow.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct FeedRow: View {
    var post: Post
    var body: some View {
        VStack(alignment: .leading){
            
//                PostHeaderRow(user: UserUtil.loadUserById(id: post.review.user), postDate: "April 20th, 2023")
                    HStack{
                        PostHeaderRow(user: UserUtil.loadUserById(id: post.review.user)!, postDate: "April 20th, 2023").padding(.bottom)
                    }
//            StrainSearchRow(strain: StrainUtil.loadStrainByName(name: post.review.strain)!)
            PostStrainRow(post: post)
            Divider()
            PostContentRow(post: post).padding(.top)
            
            PostFooterRow(post: post)
                
            
        }
    }
}

struct FeedRow_Previews: PreviewProvider {
    static var previews: some View {
        FeedRow(post: Post.example)
    }
}
