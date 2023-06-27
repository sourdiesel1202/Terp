//
//  StrainDetailAverageRatingRow.swift
//  Flowr
//
//  Created by Andrew on 5/22/23.
//

import SwiftUI

struct StrainDetailAverageRatingRow: View {
    let strain: StrainJSON
    @State private var userRating: Int = 1
    @State private var userDescription: String = ""
    @State private var isShowingReviewSheet: Bool = false
    @State private var loading: Bool = true
    var body: some View {
        VStack {
            HStack{
                Text("Average Rating").padding([.leading,.bottom]).font(.subheadline).fontWeight(.bold)
                Spacer()
            }
            
            if self.loading{
                ProgressView().padding()
            }else{
                RatingView(rating: .constant(self.userRating)).frame(height: 50).padding(.bottom)
                NavigationLink{
                    StrainRateView(strain: self.strain)
                }label: {
                    FullWidthText(text: "Review")
                }
                
                    
                
                    
                
            }
            
        }.onAppear{
            DispatchQueue.global(qos: .utility).async {
//                    let strainData = StrainJSONUtil.loadStrains()
//                let _searchResults = loadSearchResults()
                let tmpRating = ReviewUtil.loadAverageRatingByStrain(strain: self.strain)
                DispatchQueue.main.async {
//                    self.searchResults = _searchResults
                    self.userRating=tmpRating
//                        self.strains = strainData
                    self.loading = false
                }
            }
        }
    }
}

struct StrainDetailAverageRatingRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailAverageRatingRow(strain: StrainJSON.example)
    }
}
