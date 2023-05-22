//
//  SwiftUIView.swift
//  Flowr
//
//  Created by Andrew on 5/19/23.
//

import SwiftUI

struct PostCommentRow: View {
    let user: User
    let text: String
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                if self.user.image.count > 0{
                    URLImage(url: self.user.image, shape: AnyShape(Circle()))
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 90, maxHeight: 40)
                }else{
                    Image(systemName: "person.fill").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 90, maxHeight: 40)
                }
                
                VStack(alignment: .leading){
                    Text(user.username).font(.caption).fontWeight(.bold)
                    Text(self.text).font(.caption2)
                    
                    HStack(alignment: .center){
                        Button(action: {}){
                            Text("Like").font(.caption)
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

struct PostCommentRow_Previews: PreviewProvider {
    static var previews: some View {
        PostCommentRow(user: User.example, text: "This is a test comment")
    }
}
