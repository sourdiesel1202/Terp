//
//  SwiftUIView.swift
//  Flowr
//
//  Created by Andrew on 5/19/23.
//

import SwiftUI

struct UserCommentRow: View {
//    let user: User
//    let text: String
    let comment: Comment
    @Binding var reply: Comment
    @State private var isShowingProfileSheet: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                Button(action: {self.isShowingProfileSheet=true}, label: {
                    
                
                    if UserUtil.loadUserById(id: self.comment.user).image.count > 0{
                    URLImage(url: UserUtil.loadUserById(id: self.comment.user).image, shape: AnyShape(Circle()))
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 90, maxHeight: 40)
                }else{
                    Image(systemName: "person.fill").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 90, maxHeight: 40)
                }
                })
                VStack(alignment: .leading){
                    Button(action: {
                        self.isShowingProfileSheet=true
                        
                    })
                    {
                        Text(UserUtil.loadUserById(id: self.comment.user).username).font(.caption).fontWeight(.bold)
                        
                    }.sheet(isPresented: self.$isShowingProfileSheet, content: {
                        ProfileView(user: UserUtil.loadUserById(id: self.comment.user))
                    })
                    Text(self.comment.description).font(.caption2)
                    Text("")
                    HStack(alignment: .center){
                        Image(systemName: "heart")
                        Text("69").font(.caption2).padding(.trailing)
                        Button(action: {
                            self.reply=self.comment
                        }){
                            Text("Reply").font(.caption)
                            //                            Image(systemName: "heart").frame(width: 10, height: 20)
                        }.padding([.trailing])
                        
                        Button(action: {}){
                            Text("Comment").font(.caption)
                            //                            Image(systemName: "message").frame(width: 10, height: 20)
                        }
                        
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct UserCommentRow_Previews: PreviewProvider {
    static var previews: some View {
        UserCommentRow(comment: Comment.example, reply: .constant(Comment.example))
    }
}
