//
//  CommentView.swift
//  Flowr
//
//  Created by Andrew on 5/27/23.
//

import SwiftUI

struct CommentView: View {
    @State var post: Post
//    let depth: Int
    @State var replyingTo: Comment
//    @State var replyingTo: Comment
//    @State private var comments: some View {
//        return Text("")
//    }
    @State private var commentReply: String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("Comments").font(.title).fontWeight(.bold)
            ForEach(self.post.comments){ comment in
                UserCommentRow(comment: comment, reply: $replyingTo )
//                UserCommentRow(user: UserUtil.loadUserById(id: comment.user)!,/ text: comment.description)
                    
                
                if comment.replies != nil{
                    ForEach(comment.replies!){ commentReply in
                        UserCommentRow(comment: commentReply, reply: $replyingTo ).padding([.leading])
                    }
                    ForEach(comment.replies!){ commentReply in
                        if self.replyingTo.id == commentReply.id{
                            CommentReplyRow(user: User.example, replyTo: UserUtil.loadUserById(id: commentReply.user), text: self.$commentReply, action: {
                                print("replied")
                                self.rebuildPost(newComment: Comment(id: "\(commentReply.id)\(Int.random(in: 50..<100))", user: User.example.id, description: self.commentReply))
                                //ok annoying but a hack
//                                self.post.comments.forEach(){ _comment in
//                                    _comment.replies.forEach(){ _reply in
//                                        if _repl;lk,asdvk,asdvlkmy.id == self.replyingTo.id{
//                                            _reply.replies.append(Comment(id: "\(self.post.comments[0].id)69", user: User.example.id, description: self.commentReply))
//                                        }
//                                    }
//                                }
//                                self.post.comments.first(where: {$0.replies!.contains(where:{$0.id==commentReply.id})})!.replies!.append(Comment(id: "\(self.post.comments[0].id)69", user: User.example.id, description: self.commentReply))
                                
                            }).padding([.leading])
                        }
                    }
                }
                
                if self.replyingTo.id == comment.id {
                    CommentReplyRow(user: User.example, replyTo: UserUtil.loadUserById(id: comment.user),text: self.$commentReply, action: {
                        print("Replied")
//                        let reply = self.commentReply
//                        self.post.comments.append(Comment(id: "\(self.post.comments[0].id)\(Int.random(in: 50..<100))", user: User.example.id, description: self.commentReply))
                        self.rebuildPost(newComment: Comment(id: "\(comment.id)\(Int.random(in: 50..<100))", user: User.example.id, description: self.commentReply))
                        self.commentReply=""
//                        post.comments.first(where: {$0.id==comment.id}).append(Comment(id: "\(self.post.comments[0].id)69", user: User.example.id, description: self.commentReply))
                        
                    }).padding([.leading])
                }
            }
            if self.replyingTo.id == Comment.example.id {
                NewCommentRow(post: self.post,text: self.$commentReply, action:{
                    print("New comment posted")
//                    let reply = self.commentReply
                    //so here we call the backend to update
//                    self.post.comments.append(Comment(id: "\(self.post.comments[0].id)\(Int.random(in: 50..<100))", user: User.example.id, description: self.commentReply))
                    self.rebuildPost(newComment: Comment(id: "\(self.post.comments[0].id)\(Int.random(in: 50..<100))", user: User.example.id, description: self.commentReply))
                    self.commentReply=""
                    
                })//.padding([.leading])
            }
        }.padding()
    }
    
    func rebuildPost(newComment: Comment){
        var _post = Post(id: self.post.id, review: self.post.review, likes: self.post.likes, comments: [Comment]())
        // ok so the dumb idea here is that we reload the comments and add the new comment accordingly
        self.post.comments.forEach(){ comment in
            var _comment = comment
            if _comment.id==self.replyingTo.id
            {
                if _comment.replies == nil{
                    _comment.replies = [Comment]()
                }
                _comment.replies?.append(newComment)
//                _comment.replies?.append(new)
            }
            if _comment.replies != nil{
                _comment.replies?.forEach(){ reply in
                    if reply.id == self.replyingTo.id{
                        _comment.replies?.append(newComment)
                    }
                }
            }
            
            _post.comments.append(_comment)
        }
        if self.replyingTo.id==Comment.example.id{
            
            _post.comments.append(newComment)
        }
        
        self.post = _post
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(post: Post.example, replyingTo: Comment.example)
    }
}
