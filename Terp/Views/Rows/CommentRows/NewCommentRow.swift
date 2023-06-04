//
//  NewCommentRow.swift
//  Flowr
//
//  Created by Andrew on 5/28/23.
//

import SwiftUI

struct NewCommentRow: View {
    let post: Post
    @State var text: Binding<String>
    let action: () -> Void
//    @State private var text: String = ""
    
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
                        TextField("Comment",text: self.text)
                        Button(action: self.action, label: {
                            Text("Post").font(.caption)
                        })
                    }
                }
                
                Spacer()
            }
        }
    }

}

struct NewCommentRow_Previews: PreviewProvider {
    static var previews: some View {
        NewCommentRow(post: Post.example,text: .constant(""), action: {})
    }
}
