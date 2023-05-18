//
//  PostStrainRow.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct PostStrainRow: View {
//    let strain: Strain
    let post: Post
    var body: some View {
//        VStack(alignment: .center){
//            Text("Strain")
//        }
        
        VStack(){
//            Divider().padding(.top)
//            NavigationLink(desination: StrainDetailView(strain: strain)){
                Button(action: {}){
                    
                    
                    HStack{
                        
                        Text("Strain:").fontWeight(.bold)
                        Text(post.review.strain)
                        Spacer()
                        ForEach(1..<5 + 1, id: \.self) { number in
                            if number <= post.review.rating{
                                Image(systemName: "star.fill").foregroundColor(.blue)
                            }else{
                                Image(systemName: "star").foregroundColor(.blue)
                            }
//                            image(for: number).resizable().scaledToFit()
//                                .foregroundColor(number > rating ? offColor : onColor)
//                                .onTapGesture {
//                                    rating = number
//                                }
                        }
//                        if strain.image.count == 0{
//                            Image(systemName: "leaf.circle").resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(maxWidth: 90, maxHeight: 40).clipShape(Circle())
//                            //                SystemImageRow(text: strain, img: <#T##String#>)
//                        }else{
//                            AsyncImage(
//                                url: URL(string: strain.image),
//                                content: { image in
//                                    image.resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(maxWidth: 90, maxHeight: 40)
//                                },
//                                placeholder: {
//                                    ProgressView()
//                                }
//                            ).clipShape(Circle())
//
//                        }
                        
                    }
                    
                }.foregroundColor(.black)
//                Divider().padding(.bottom)
                
            }
        
    }
//    }
}

struct PostStrainRow_Previews: PreviewProvider {
    static var previews: some View {
        PostStrainRow(post: Post.example)
    }
}
