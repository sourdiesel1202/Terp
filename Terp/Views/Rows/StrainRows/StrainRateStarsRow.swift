//
//  StrainRateRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct StrainRateStarsRow: View {
    @State var rating: Binding<Int>
    var body: some View {
        VStack{
            Text("Rating").font(.title).fontWeight(.bold)
            RatingView(rating: self.rating).padding([.leading,.trailing]).frame(height: 50)
        }
    }
}

struct StrainRateStarsRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainRateStarsRow(rating: .constant(3))
    }
}
