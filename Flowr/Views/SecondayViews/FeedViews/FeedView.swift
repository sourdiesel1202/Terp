//
//  FeedView.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(.vertical)
        {
            
            VStack(alignment: .leading){
                
                ForEach(self.posts) { (post: Post) in
                    FeedRow(post: post).padding(.bottom).padding(.top)
                    ViewDivider(height: 4)
                        
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(.blue, lineWidth: 4)
                    
                    //                PostHeaderRow(user: UserUtil.loadUserById(id: post.review.user), postDate: "April 20th, 2023")
                    //                    HStack{
                    //                        PostHeaderRow(user: UserUtil.loadUserById(id: post.review.user)!, postDate: "April 20th, 2023").padding(.bottom)
                    //                    }
                    //                PostContentRow(post: post)
                    
                    
                }
            }
        }.safeAreaInset(edge: .top) {
            HStack{
                
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass").resizable().frame(width: 30, height: 30)
                    
                })
                Spacer()
                Button(action: {}, label: {
                    NavigationLink{
                        NotificationsView()
                    }label:{
                        Image(systemName: "bell.fill").resizable().frame(width: 30, height: 30)
                    }
                })
                Button(action: {}, label: {
                    NavigationLink{
                        MessagesView(user: User.example)
                    }label:{
                        Image(systemName: "bubble.left.and.bubble.right.fill").resizable().frame(width: 30, height: 30)
                    }
                }).padding(.leading)
                
            }.padding([.leading, .trailing])
//            Text("Outside Safe Area")
//                .font(.largeTitle)
////                .foregroundColor(.white)
//                .frame(maxWidth: .infinity)
//                .padding()
////                .background(.indigo)
        }.padding(.bottom)
//            Text("Outside Safe Area")
//                .font(.largeTitle)
////                .foregroundColor(.white)
//                .frame(maxWidth: .infinity)
//                .padding()
////                .background(.indigo)
        
    }
//    var posts: [Post]
    var posts: [Post] {
        return PostUtil.loadPublicFeed()
//            if searchText.isEmpty {
//                return data
//            } else {
//                return data.filter { $0.key.lowercased().contains(searchText.lowercased()) || $0.value.lowercased().contains(searchText.lowercased()) }
//            }
        }

}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
