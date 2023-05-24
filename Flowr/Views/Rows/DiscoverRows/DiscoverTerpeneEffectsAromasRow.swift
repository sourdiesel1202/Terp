//
//  DiscoverTerpeneEffectsAromasRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct DiscoverTerpeneEffectsAromasRow: View {
    let terpene: Terpene
    var body: some View {
        Text("Explore Your Terpene Profile").padding([.top,.bottom])
        RowHeaderViewAll(text: "Explore Other Effects of \(terpene.name)")
        HorizontalTerpeneEffectAromaRow(data: TerpeneUtil.loadTerpeneEffects(terpenes: [self.terpene] ))
        
    }
}

struct DiscoverTerpeneEffectsAromasRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverTerpeneEffectsAromasRow(terpene: Terpene.example)
    }
}
