//
//  FeedRow.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct PostContentRow: View {
    var post: Post
    var body: some View {
        VStack{
            VStack(alignment: .leading){
//                HStack{
//                    PostHeaderRow(user: user, postDate: "April, 20th")
//                }
                Section{
                    
                    if post.review.image.count != 0{
                        Text(post.review.description).padding(.leading)
                        AsyncImage(
                            url: URL(string: post.review.image),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }else{
                        Text(post.review.description).padding(.leading)
                    }
                }
            }
        }
    }
    
    var user: User {
        return UserUtil.loadUserById(id: post.review.user)
        
    }
}

struct PostContentRow_Previews: PreviewProvider {
    static var previews: some View {
        PostContentRow(post: Post.example)
    }
}
