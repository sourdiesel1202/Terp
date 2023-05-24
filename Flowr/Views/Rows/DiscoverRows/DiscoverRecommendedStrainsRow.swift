//
//  DiscoverRecommendedStrainsRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct DiscoverRecommendedStrainsRow: View {
    private var strains: [Strain] {
        return StrainUtil.loadStrains()
    }
    var body: some View {
        VStack{
            Text("Strains Based Upon Your Terpene Profile").padding([.top,.bottom])
            RowHeaderViewAll(text: "Recommended Strains")
//            Text("Recommened Strains")
            HorizontalStrainListRow(strains: Array(self.strains[0...5]))
            RowHeaderViewAll(text: "Strains with Earthy aromas")
            HorizontalStrainListRow(strains: Array(self.strains[10...15]))
            RowHeaderViewAll(text: "Strains with Sedative effects")
            HorizontalStrainListRow(strains: Array(self.strains[4...9]))
            
        }
    }
}

struct DiscoverRecommendedStrainsRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverRecommendedStrainsRow()
    }
}
