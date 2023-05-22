//
//  StrainDetailAverageRatingRow.swift
//  Flowr
//
//  Created by Andrew on 5/22/23.
//

import SwiftUI

struct StrainDetailAverageRatingRow: View {
    let strain: Strain
    var body: some View {
        VStack {
            HStack{
                Text("Average Rating").padding([.leading,.bottom]).font(.subheadline).fontWeight(.bold)
                Spacer()
            }
            
            RatingView(rating: .constant(ReviewUtil.loadAverageRatingByStrain(strain: self.strain))).frame(height: 50).padding(.bottom)
            //                    HStack{
            //                        Text("Identified Terpenes (\(self.strain.terpenes.count))").padding([.leading,.bottom]).font(.caption)
            //                        Spacer()
            //                        NavigationLink{
            //                            ContentView()
            //                        }label: {
            //                            Text("View All").font(.caption).padding([.bottom,.trailing])
            //                        }
            //                    }
            
            
        }
    }
}

struct StrainDetailAverageRatingRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailAverageRatingRow(strain: Strain.example)
    }
}
