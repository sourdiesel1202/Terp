//
//  RowHeader.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct RowHeaderViewAll: View {
    let text: String
    let data: [DataMap]
    var body: some View {
        HStack{
            Text(self.text).padding([.leading,.bottom]).font(.subheadline)//.fontWeight(.bold)
            Spacer()
            NavigationLink{
                ThumbnailListView(data: self.data, searchTitle: self.text)
            }label: {
                Text("View All").font(.subheadline).padding([.bottom,.trailing])
            }
            
        }
    }
}

struct RowHeaderViewAll_Previews: PreviewProvider {
    static var previews: some View {
        RowHeaderViewAll(text: "Terpene Profile", data:  TerpeneJSONUtil.loadAromaDataMap(aromas: ["Blueberry"]))
    }
}
