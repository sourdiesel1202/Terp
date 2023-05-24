//
//  DiscoverHeaderRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct DiscoverHeaderRow: View {
    var body: some View {
        VStack{
            Text("Discover").fontWeight(.bold).font(.title)
            Text("Find strains by effect and aroma, discover nearby dispensaries and recommended strains and more")
        }
    }
}

struct DiscoverHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverHeaderRow()
    }
}
