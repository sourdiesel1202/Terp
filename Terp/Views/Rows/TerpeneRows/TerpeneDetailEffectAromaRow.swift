//
//  TerpeneDetailEffectAromaRow.swift
//  Flowr
//
//  Created by Andrew on 5/25/23.
//

import SwiftUI

struct TerpeneDetailEffectAromaRow: View {
//    let text: String
//    let data: [String]
    let terpene: TerpeneJSON
    var body: some View {
        VStack{
            Text("Effects & Aromas").font(.title).fontWeight(.bold).padding(.bottom)
            RowHeaderViewAll(text: "Aromas (\(self.terpene.aromas.count))", data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.terpene.aromas))
            HorizontalTerpeneEffectAromaRow(data: self.terpene.aromas)
            ViewDivider(height: 0.25)
            RowHeaderViewAll(text: "Effects (\(self.terpene.effects.count))", data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.terpene.effects))
            HorizontalTerpeneEffectAromaRow(data: self.terpene.effects)
//            RowHeaderViewAll(text: , data: TerpeneUtil.loadAromaEffectDataMap(data: self.data))
            
        }
    }
}

struct TerpeneDetailEffectAromaRow_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneDetailEffectAromaRow(terpene: TerpeneJSON.example)
    }
}
