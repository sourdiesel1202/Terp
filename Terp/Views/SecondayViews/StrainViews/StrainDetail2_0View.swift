//
//  StrainDetail2.0.swift
//  Flowr
//
//  Created by Andrew on 5/19/23.
//

import SwiftUI

struct StrainDetail2_0View: View {
    let strain: Strain
    private var posts: [Post]{
        return PostUtil.loadPublicStrainFeed(strain: self.strain)
    }
    var body: some View {
        
        VStack{
            ScrollView{
                VStack{
                    StrainDetailHeaderRow(strain: self.strain)
                    
                    StrainDetailAverageRatingRow(strain: self.strain)
                    ViewDivider(height: 0.5)
                    StrainDetailSourcesRow(strain: self.strain)
                    ViewDivider(height: 4)
                    StrainDetailLineageRow(strain: self.strain)
                    ViewDivider(height: 4)
                    StrainDetailTerpeneProfileRow(strain: self.strain)
                    ViewDivider(height: 4)
                }
                    HStack{
                        Text("Public Posts (\( self.posts.count))").padding([.leading,.bottom]).font(.subheadline).fontWeight(.bold)
                        Spacer()
                        NavigationLink{
                            ContentView()
                        }label: {
                            Text("View All").font(.caption).padding([.bottom,.trailing])
                        }
                    }
//                    ScrollView(.horizontal){
//                        HStack{
                    ForEach(self.posts){ post in
                        FeedRow(post: post ).padding(.bottom).padding(.top)
                        ViewDivider(height: 4)
                    }
//                                ViewDivider(height: 4)
                                //                            VStack{
                                //                                CircleText(text: effect, color: .blue)
                                //                                Text(effect).font(.caption).fontWeight(.bold)
                                //
                                //                            }
                                
//                            }.padding([.leading,.trailing,])
//                        }
//                    }
                    
                    //
                }
            
        }
        
    }
}

struct StrainDetail2_0View_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetail2_0View(strain: Strain.example)
    }
}
