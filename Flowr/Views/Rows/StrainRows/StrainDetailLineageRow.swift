//
//  StrainDetailLineageRow.swift
//  Flowr
//
//  Created by Andrew on 6/1/23.
//

import SwiftUI

struct StrainDetailLineageRow: View {
    let strain: Strain
    var body: some View {
        VStack{
            Text("Lineage").padding([.top,]).fontWeight(.bold)
            Text("The parents and children of \(self.strain.name)").padding([.bottom]).font(.subheadline)//.fontWeight(.bold)
            
            if StrainUtil.loadStrainParents(strain: self.strain).count > 0{
                RowHeaderViewAll(text: "Parents", data: StrainUtil.loadStrainDataMap(strains: StrainUtil.loadStrainParents(strain: self.strain)))
                HorizontalStrainListRow(strains: StrainUtil.loadStrainParents(strain: self.strain))
            }else{
                RowHeader(text: "Parents (0)")
            }
            ViewDivider(height: 0.5).padding(.bottom)
            if StrainUtil.loadStrainChildren(strain: self.strain).count > 0{
                RowHeaderViewAll(text: "Children", data: StrainUtil.loadStrainDataMap(strains: StrainUtil.loadStrainChildren(strain: self.strain)))
                HorizontalStrainListRow(strains: StrainUtil.loadStrainChildren(strain: self.strain))
            }else{
                RowHeader(text: "Children (0)")
            }
        }
    }
}

struct StrainDetailLineageRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailLineageRow(strain: Strain.example)
    }
}
