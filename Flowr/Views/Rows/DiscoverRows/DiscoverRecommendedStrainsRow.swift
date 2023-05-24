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
            Text("Strain Recommendations Based On Your Terpene Profile").fontWeight(.bold).padding().font(.title).multilineTextAlignment(.center)
                .lineLimit(nil)
            RowHeaderViewAll(text: "Recommended Strains")
//            Text("Recommened Strains")
            HorizontalStrainListRow(strains: Array(self.strains[0...5]))
            ViewDivider(height: 0.25)
            RowHeaderViewAll(text: "Strains with Earthy aromas")
            HorizontalStrainListRow(strains: Array(self.strains[10...15]))
            ViewDivider(height: 0.25)
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
