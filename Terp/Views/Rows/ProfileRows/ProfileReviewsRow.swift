//
//  ProfileReviewsRow.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileReviewsRow: View {
    let user: User
    @State private var reviewStrains: [StrainJSON] = [StrainJSON]()
    @State private var loading: Bool = true
    private var terpeneProfile: TerpeneProfile{
        return TerpeneJSONUtil.loadTerpeneProfileByUser(user: self.user)
    }
    @State private var reviews: [Review] = [Review]()
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                //ok come back to this cause this is going to be a bit of work
                HStack{
                    Text(!self.loading ? "Reviews (\(self.reviews.count))" : "Reviews").padding([.leading,.bottom]).font(.caption)
                    Spacer()
                    NavigationLink{
                        ProfileReviewList(user: self.user)
                    }label: {
                        //                        NavigationLink{}label"
                        Text("View All").font(.caption).padding([.bottom,.trailing])
                    }
                }
                if loading{
                    VStack{
                        ProgressView().padding()
                        Text("Loading Reviews").font(.caption)
                    }
                }else{
                    //                ProfileReviewsRow(user: self.user)
                    ScrollView(.horizontal){
                        HStack(alignment: .top){
                            
                            ForEach(self.reviews){ review in
                                NavigationLink {
                                    StrainDetail2_0View(strain: StrainJSONUtil.loadStrainByName(name: review.strain)!)
                                }label: {
                                    VStack{
                                        URLImage(url: StrainJSONUtil.loadStrainByName(name: review.strain)!.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).frame(maxWidth: .infinity)
                                        
                                        Text(StrainJSONUtil.loadStrainByName(name: review.strain)!.name).font(.caption).fontWeight(.bold)
                                        
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
                                    NavigationLink{
                                        ProfileReviewList(user: self.user)
                                    }label:{
                                        VStack{
                                            Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.gray)
                                            Text("View All").font(.caption2).fontWeight(.bold).foregroundColor(.gray)
                                            
                                        }
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
        }.onAppear{
            DispatchQueue.global(qos: .utility).async {
                let _reviews = ReviewUtil.loadReviewsByUser(user: self.user)
//                let strainData = StrainJSONUtil.loadStrainByName(name: self.review.strain)
//                let _strain = StrainJSONUtil.loadStrainByName(name: T##String)
                var _strainReviews = [StrainJSON]()
                _reviews.forEach(){ review in
                    _strainReviews.append(StrainJSONUtil.loadStrainByName(name: review.strain)!)
                }
                DispatchQueue.main.async {
//                    self.strain = strainData!
                    self.reviews = _reviews
                    self.reviewStrains = _strainReviews
//                    self.children = children
//                    self.parents = parents
//                    self.searchResults = _searchResults
//                        self.strains = strainData
                    self.loading = false
                }
            }
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
