//
//  PostFooterRow.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct PostFooterRow: View {
    @State var post: Post
//    @State private var buttonClicked: Bool = false
    @State private var comment: String = ""
    @State private var isShowingLikesSheet: Bool = false
//    @State private var isShowingCommentSheet: Bool = false
    @FocusState private var isCommentEditorActive: Bool
    var body: some View {
        VStack{
            HStack{
                
                    if self.post.likes.contains(where:{$0.user == User.example.id}){
                        Button(action: {
                            print("unlike button pressed")
//                            self.buttonClicked.toggle()
                            PostUtil.unlikePost(post: self.post, user: User.example)
                            self.post.likes.removeAll(where: {$0.user == User.example.id })
//                            self.post.likes.removeAll(where: {$0.user == User.example })
                            
                        }){
                            Image(systemName: "hand.thumbsup.fill").resizable().frame(width: 35, height: 30).padding(.leading).padding(.bottom).padding(.top)
                        }
                    }else{
                        Button(action: {
                            print("Like button pressed")
//                            self.buttonClicked.toggle()
                            PostUtil.likePost(post: self.post, user: User.example)
                            self.post.likes.append(Like(user: User.example.id))
                            
                        }){
                        Image(systemName: "hand.thumbsup").resizable().frame(width: 35, height: 30).padding(.leading).padding(.bottom).padding(.top)
                    }
                    
                    
                    }
                Spacer()
                Button(action: {}){
                    Image(systemName: "bubble.left").resizable().frame(width: 30, height: 30).padding(.trailing).padding(.bottom).padding(.top)
                    
                    
                }
                
            }
            Divider()
            HStack{
                if post.likes.count > 0{
                    Button(action: {self.isShowingLikesSheet.toggle()}){
                        Text("\(post.likes.count) likes").padding(.leading)
                    }.sheet(isPresented: self.$isShowingLikesSheet){
                        ScrollView(.vertical){
                            VStack(alignment: .leading){
                                
                                ForEach(post.likes){ like in
                                    
                                    HStack{
                                        Image(systemName: "hand.thumbsup.fill").foregroundColor(.blue)
                                        PostHeaderRow(user: UserUtil.loadUserById(id: like.user), postDate: "")
                                        
                                        
                                    }.padding(.leading)
                                    //                            NavigationStack{
                                    //                                List
                                    //                            }
                                    
                                }
                            }
                        }.padding(.top)
                    }
//                    NavigationLink {
//                        ContentView()
//                    }label:{
//                        Text("\(post.likes.count) likes").padding(.leading)
//                    }
//                    }.foregroundColor(.blac)
                }else{
                    Text("")
                }
//                Text("\(post.likes.co)")
                Spacer()
                if post.comments.count > 0{
                    Button(action: {}){
                        
                        NavigationLink{
                            CommentView(post: self.post, replyingTo: Comment.example)
                        }label:{
                            Text("\(post.comments.count) comments").padding(.trailing)
                        }
                    }
//                            ForEach(self.post.comments){ comment in
//                                UserCommentRow(user: UserUtil.loadUserById(id: comment.user)!, text: comment.description).padding()
//
//                            }
//                            NewCommentRow(user: User.example)
//                            KeyboardTextField()
//                            TextField("Enter your name", text: )
//                                        .textFieldStyle(.roundedBorder)
//                                        .toolbar {
//                                            ToolbarItemGroup(placement: .keyboard) {
//                                                Button("Click me!") {
//                                                    print("Clicked")
//                                                }
//                                            }
//                                        }
//                            VStack(alignment: .trailing){
//                                TextField("Post your reply", text: self.$comment).focused(self.$isCommentEditorActive)
//
//                            }
//                        }
                        
//                        Spacer()
                        
//                    }).padding(.top)
                }else{
                    Text("")
                }
                
            }
            
//            Divider()
            
        }
    }
}

struct PostFooterRow_Previews: PreviewProvider {
    static var previews: some View {
        PostFooterRow(post: Post.example)
    }
}
