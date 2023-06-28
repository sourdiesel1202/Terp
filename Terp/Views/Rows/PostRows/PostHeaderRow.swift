//
//  PostHeaderRow.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct PostHeaderRow: View {
    var user: User
    var postDate: String
    @State private  var showingOptions: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                NavigationLink{
                    ProfileView(user: self.user)
                } label:{
                    if user.image.count == 0{
                        //use system image
                        Image(systemName: "person.fill").resizable().aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 90, maxHeight: 40).clipShape(Circle())
                    }else{
                        
                        AsyncImage(
                            url: URL(string: user.image),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 90, maxHeight: 40)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        ).clipShape(Circle())
                    }
                    
                    VStack (alignment: .leading){
                        Text(user.username).font(.subheadline).fontWeight(.bold)
                        Text(self.postDate).font(.caption)
                    }.padding(.trailing).padding(.trailing).padding(.trailing).padding(.trailing).padding(.trailing).padding(.trailing)
                }
                Spacer()
                Button(action:{
                    self.showingOptions = true
                }){
                    Image(systemName: "ellipsis").frame(width: 25, height: 15)
                }.padding(.trailing).confirmationDialog("Options", isPresented: self.$showingOptions) {
                    Button("Report") {
                        self.showingOptions = false
                    }
                    if self.user.id == User.example.id{
                        Button("Delete", role: .destructive) {
                            self.showingOptions = false
                        }
                    }
//                    Button("Green") {  }
//                    Button("Blue") {  }
                    Button("Cancel", role: .cancel) {
                        self.showingOptions = false
                    }
                } message: {
                    Text("Post Options").font(.title)
                }
            }
            
        }
    }
}

struct PostHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        PostHeaderRow(user: User.example, postDate: "April, 20th, 2022")
    }
}
