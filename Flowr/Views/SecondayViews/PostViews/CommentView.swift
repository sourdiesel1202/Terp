//
//  CommentView.swift
//  Flowr
//
//  Created by Andrew on 5/27/23.
//

import SwiftUI

struct CommentView: View {
    let post: Post
//    let depth: Int
    @State var replyingTo: Comment
//    @State var replyingTo: Comment
//    @State private var comments: some View {
//        return Text("")
//    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Comments").font(.title).fontWeight(.bold)
            ForEach(self.post.comments){ comment in
                UserCommentRow(comment: comment, reply: $replyingTo )
//                UserCommentRow(user: UserUtil.loadUserById(id: comment.user)!,/ text: comment.description)
                    if self.replyingTo.id == comment.id {
                        NewCommentRow(user: User.example, replyTo: UserUtil.loadUserById(id: comment.user)).padding([.leading])
                    }
                
                if comment.replies != nil{
                    ForEach(comment.replies!){ commentReply in
                        UserCommentRow(comment: commentReply, reply: $replyingTo ).padding([.leading])
//                        UserCommentRow(user: UserUtil.loadUserById(id: commentReply.user)!, text: commentReply.description).padding([.leading])
//                            if self.replyingTo.id == commentReply.id{
//                                NewCommentRow(user: UserUtil.loadUserById(id: commentReply.user)!, replyTo: comment.user).padding([.leading])
//
//                        }
                    }
                }
            }
//            if self.replyingTo.id == self.post.comments[0].id{
//            NewCommentRow(user: User.exa)
//
//            }
        }.padding()
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(post: Post.example, replyingTo: Comment.example)
    }
}
