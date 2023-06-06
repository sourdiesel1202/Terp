//
//  TerpeneDetailStrainRow.swift
//  Flowr
//
//  Created by Andrew on 5/25/23.
//

import SwiftUI

struct TerpeneDetailStrainRow: View {
    let terpene: TerpeneJSON
    private var strains: [StrainJSON]{
        return StrainJSONUtil.loadStrainsByTerpene(terpene: self.terpene)
    }
    var body: some View {
        RowHeaderViewAll(text: "Strains Containing \(self.terpene.name)", data: StrainJSONUtil.loadStrainDataMap(strains: self.strains))
        HorizontalStrainListRow(strains: self.strains)
    }
}

struct TerpeneDetailStrainRow_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneDetailStrainRow(terpene: TerpeneJSON.example)
    }
}
