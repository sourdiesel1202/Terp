//
//  StrainDetailLineageRow.swift
//  Flowr
//
//  Created by Andrew on 6/1/23.
//

import SwiftUI

struct StrainDetailLineageRow: View {
    let strain: StrainJSON
    var body: some View {
        VStack{
            Text("Lineage").padding([.top,]).fontWeight(.bold)
            Text("The parents and children of \(self.strain.name)").padding([.bottom]).font(.subheadline)//.fontWeight(.bold)
            
            if StrainJSONUtil.loadStrainParents(strain: self.strain).count > 0{
                RowHeaderViewAll(text: "Parents", data: StrainJSONUtil.loadStrainDataMap(strains: StrainJSONUtil.loadStrainParents(strain: self.strain)))
                HorizontalStrainListRow(strains: StrainJSONUtil.loadStrainParents(strain: self.strain))
            }else{
                RowHeader(text: "Parents (0)")
            }
            ViewDivider(height: 0.5).padding(.bottom)
            if StrainJSONUtil.loadStrainChildren(strain: self.strain).count > 0{
                RowHeaderViewAll(text: "Children", data: StrainJSONUtil.loadStrainDataMap(strains: StrainJSONUtil.loadStrainChildren(strain: self.strain)))
                HorizontalStrainListRow(strains: StrainJSONUtil.loadStrainChildren(strain: self.strain))
            }else{
                RowHeader(text: "Children (0)")
            }
        }
    }
}

struct StrainDetailLineageRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailLineageRow(strain: StrainJSON.example)
    }
}
