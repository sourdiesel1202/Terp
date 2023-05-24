//
//  DiscoverTerpeneEffectsAromasRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct DiscoverTerpeneEffectsAromasRow: View {
    let terpene: Terpene
//    private var terpeneSection: some View{
//
//    }
    var body: some View {
        Text("Explore Your Terpene Profile").padding([.top,.bottom]).fontWeight(.bold).font(.title)
        VStack{
            RowHeaderViewAll(text: "Explore Other Effects of \(terpene.name)").font(.subheadline)
            HorizontalTerpeneEffectAromaRow(data: TerpeneUtil.loadTerpeneEffects(terpenes: [self.terpene] ))
            FullWidthButton(text: "View All Terpene Effects", action: {}   ).padding()
        }
            VStack{
                ViewDivider(height: 0.25)
                RowHeaderViewAll(text: "Explore Other Aromas of \(terpene.name)")
                HorizontalTerpeneEffectAromaRow(data: TerpeneUtil.loadTerpeneAromas(terpenes: [self.terpene] ))
                FullWidthButton(text: "View All Terpene Aromas", action: {}).padding()
            }
//            ViewDivider(height: 0.25)
        VStack{
            ViewDivider(height: 0.25)
            RowHeaderViewAll(text: "Terpenes similar to \(terpene.name)")
            HorizontalTerpeneEffectAromaRow(data: TerpeneUtil.loadTerpeneAromas(terpenes: [self.terpene] ))
            FullWidthButton(text: "View All Terpenes", action: {}).padding()
            
        }
    }
}

struct DiscoverTerpeneEffectsAromasRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverTerpeneEffectsAromasRow(terpene: Terpene.example)
    }
}
