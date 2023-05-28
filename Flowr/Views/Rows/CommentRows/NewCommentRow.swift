//
//  NewCommentRow.swift
//  Flowr
//
//  Created by Andrew on 5/27/23.
//

import SwiftUI

struct NewCommentRow: View {
    let user: User
    let replyTo: User
//    let comment: Comment
    @State private var text: String = ""
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                //                Button(action: {self.isShowingProfileSheet=true}, label: {
                //
                //
//                if self.user.image.count > 0{
//                    URLImage(url: self.user.image, shape: AnyShape(Circle()))
//                        .aspectRatio(contentMode: .fit)
//                        .frame(maxWidth: 90, maxHeight: 40)
//                }else{
                    Image(systemName: "person.fill").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 90, maxHeight: 40)
//                }
                
                VStack(alignment: .leading){
                    Button(action: {
                        //                        self.isShowingProfileSheet=true
                        
                    })
                    {
                        Text("Hmm").font(.caption).fontWeight(.bold)
                        
                    }
//                    Text(self.text).font(.caption2)
                    HStack{
                        TextField("Replying to @\(self.replyTo.username)",text: self.$text)
                        Button(action: {}, label: {
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

struct NewCommentRow_Previews: PreviewProvider {
    static var previews: some View {
        NewCommentRow( user: User.example, replyTo: User.example)
    }
}
