//
//  StrainDetailLineageRow.swift
//  Flowr
//
//  Created by Andrew on 6/1/23.
//

import SwiftUI

struct StrainDetailLineageRow: View {
    let strain: StrainJSON
    @State private var parents: [StrainJSON] = [StrainJSON]()
    @State private var children: [StrainJSON] = [StrainJSON]()
//    let children: [StrainJSON]
    @State private var loading: Bool = true
    var body: some View {
        VStack{
            Text("Lineage").padding([.top,]).fontWeight(.bold)
            Text("The parents and children of \(self.strain.name)").padding([.bottom]).font(.subheadline)//.fontWeight(.bold)
            if loading{
                ProgressView().padding()
            }else{
                if StrainJSONUtil.loadStrainParents(strain: self.strain).count > 0{
                    RowHeaderViewAll(text: "Parents", data: StrainJSONUtil.loadStrainDataMap(strains: self.parents))
                    HorizontalStrainListRow(strains: self.parents)
                }else{
                    RowHeader(text: "Parents (0)")
                }
                ViewDivider(height: 0.5).padding(.bottom)
                if StrainJSONUtil.loadStrainChildren(strain: self.strain).count > 0{
                    RowHeaderViewAll(text: "Children", data: StrainJSONUtil.loadStrainDataMap(strains: self.children))
                    HorizontalStrainListRow(strains: self.children)
                }else{
                    RowHeader(text: "Children (0)")
                }
            }
        }.onAppear{
            DispatchQueue.global(qos: .utility).async {
//                    let strainData = StrainJSONUtil.loadStrains()
//                let _searchResults = loadSearchResults()
                let parents = StrainJSONUtil.loadStrainParents(strain: self.strain)
                let children = StrainJSONUtil.loadStrainChildren(strain: self.strain)
                DispatchQueue.main.async {
                    self.children = children
                    self.parents = parents
//                    self.searchResults = _searchResults
//                        self.strains = strainData
                    self.loading = false
                }
            }

        }
    }
}

struct StrainDetailLineageRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailLineageRow(strain: StrainJSON.example)
    }
}
