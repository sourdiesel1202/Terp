//
//  NewCommentRow.swift
//  Flowr
//
//  Created by Andrew on 5/27/23.
//

import SwiftUI

struct CommentReplyRow: View {
    let user: User
    let replyTo: User
    @State var text: Binding<String>
    let action: () -> Void
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                Button(action: {}, label: {
                    if User.example.image.count > 0{
                        URLImage(url: User.example.image, shape: AnyShape(Circle()))
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
                        
                    })
                    {
                        Text(User.example.username).font(.caption).fontWeight(.bold)
                        
                    }
//                    Text(self.text).font(.caption2)
                    HStack{
                        TextField("Replying to @\(self.replyTo.username)'s comment",text: self.text)
                        Button(action: self.action, label: {
                            Text("Post").font(.caption)
                        })
                    }
//                    Text("")
//                    HStack(alignment: .center){
//                        Image(systemName: "heart")
//                        Text("69").font(.caption2).padding(.trailing)
//                        Button(action: {}){
//                            Text("Like").font(.caption)
//                            //                            Image(systemName: "heart").frame(width: 10, height: 20)
//                        }.padding([.trailing])
//
//                        Button(action: {}){
//                            Text("Comment").font(.caption)
//                            //                            Image(systemName: "message").frame(width: 10, height: 20)
//                        }
//
//                    }
                }
                
                Spacer()
            }
        }
    }
}

struct CommentReplyRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentReplyRow( user: User.example, replyTo: User.example, text: .constant(""), action: {})
    }
}
