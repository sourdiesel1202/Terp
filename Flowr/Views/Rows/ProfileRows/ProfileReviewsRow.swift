//
//  ProfileReviewsRow.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileReviewsRow: View {
    let user: User
    private var terpeneProfile: TerpeneProfile{
        return TerpeneUtil.loadTerpeneProfileByUser(user: self.user)
    }
    private var reviews: [Review] {
        return ReviewUtil.loadReviewsByUser(user: self.user)
    }
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Reviews (\(self.reviews.count))").padding([.leading,.bottom]).font(.caption)
                    Spacer()
                    NavigationLink{
                        ContentView()
                    }label: {
                        Text("View All").font(.caption).padding([.bottom,.trailing])
                    }
                }
            
//                ProfileReviewsRow(user: self.user)
                ScrollView(.horizontal){
                    HStack(alignment: .top){
                        
                        ForEach(self.reviews){ review in
                            Button(action: {}){
                                VStack{
                                    URLImage(url: StrainUtil.loadStrainByName(name: review.strain)!.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).frame(maxWidth: .infinity)
                                    
                                    Text(StrainUtil.loadStrainByName(name: review.strain)!.name).font(.caption).fontWeight(.bold)
                                    
                                }.padding([.trailing])
                                //                            VStack{
                                //                                URLImage(url: achievement.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).border(.gray).frame(maxWidth: .infinity)
                                //                                Text(achievement.name).font(.caption2).fontWeight(.bold)
                                //
                                //                            }.padding([.trailing, .leading])
                            }
                            
                        }
                        if self.reviews.count > 3{
                            Button(action: {}){
                                VStack{
                                    Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.gray)
                                    Text("View All").font(.caption2).fontWeight(.bold).foregroundColor(.gray)
                                    
                                }
                            }.padding([.leading,.trailing])
                        }
                    }.padding([.leading,.trailing,.bottom])
    //            }
            }
            }
//                ForEach(ReviewUtil.loadReviewsByUser(user: self.user)){ review in
////                    Text(review.strain)
//                    PostStrainRow(review: review).padding(.leading)
//                    //                ProfileReviewsRow(user: <#T##User#>)
//
//            }
            
        }
    }
//    private var reviews: [Review] {
//        return ReviewUtil.loadReviewsByUser(user: self.user)
//    }
}

struct ProfileReviewsRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileReviewsRow(user: User.example)
    }
}
