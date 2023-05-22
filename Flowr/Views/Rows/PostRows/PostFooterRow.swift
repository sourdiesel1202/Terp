//
//  PostFooterRow.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct PostFooterRow: View {
    let post: Post
    @State private var isShowingLikesSheet: Bool = false
    @State private var isShowingCommentSheet: Bool = false
    var body: some View {
        VStack{
            HStack{
                Button(action: {}){
                    Image(systemName: "hand.thumbsup").resizable().frame(width: 35, height: 30).padding(.leading).padding(.bottom).padding(.top)
                    
                    
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
                                        PostHeaderRow(user: UserUtil.loadUserById(id: like.user)!, postDate: "")
                                        
                                        
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
                if post.likes.count > 0{
                    Button(action: {self.isShowingCommentSheet=true}){
                        Text("\(post.comments.count) comments").padding(.trailing)
                    }.sheet(isPresented: self.$isShowingCommentSheet, content: {
                        
                        ForEach(self.post.comments){ comment in
                            PostCommentRow(user: UserUtil.loadUserById(id: comment.user)!, text: comment.description).padding()
                            
                        }
                        Spacer()
                    }).padding(.top)
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
