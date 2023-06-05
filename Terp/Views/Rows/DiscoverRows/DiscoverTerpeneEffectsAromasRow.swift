//
//  DiscoverTerpeneEffectsAromasRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct DiscoverTerpeneEffectsAromasRow: View {
    let terpene: TerpeneJSON
//    private var terpeneSection: some View{
//
//    }
    var body: some View {
        Text("Explore Your Terpene Profile").padding([.top,.bottom]).fontWeight(.bold).font(.title)
        VStack{
            RowHeaderViewAll(text: "Explore Other Effects of \(terpene.name)",data: TerpeneUtil.loadAromaEffectDataMap(data: TerpeneUtil.loadTerpeneEffects(terpenes: [self.terpene])))
            HorizontalTerpeneEffectAromaRow(data: TerpeneUtil.loadTerpeneEffects(terpenes: [self.terpene] ))
            NavigationLink{
                ThumbnailListView(data: TerpeneUtil.loadTerpeneEffects(terpenes: TerpeneUtil.loadTerpenes()), searchTitle: "All Terpene Effects")
            }label: {
                FullWidthText(text: "View All Terpene Effects").padding()
            }
        }
            VStack{
                ViewDivider(height: 0.25)
                RowHeaderViewAll(text: "Explore Other Aromas of \(terpene.name)", data: TerpeneUtil.loadAromaDataMap(aromas: TerpeneUtil.loadTerpeneAromas(terpenes: [self.terpene])))
                HorizontalTerpeneEffectAromaRow(data: TerpeneUtil.loadTerpeneAromas(terpenes: [self.terpene] ))
                NavigationLink{
                    ThumbnailListView(data: TerpeneUtil.loadTerpeneAromas(terpenes: TerpeneUtil.loadTerpenes()), searchTitle: "All Terpene Aromas")
                }label: {
                    FullWidthText(text: "View All Terpene Aromas").padding()
                }
            }
//            ViewDivider(height: 0.25)
        VStack{
            ViewDivider(height: 0.25)
            RowHeaderViewAll(text: "Terpenes similar to \(terpene.name)", data:TerpeneUtil.loadTerpeneDataMap(terpenes: TerpeneUtil.loadTerpenes()))
            HorizontalTerpeneEffectAromaRow(data: TerpeneUtil.loadTerpeneAromas(terpenes: [self.terpene] ))
            NavigationLink{
                ThumbnailListView(data: TerpeneUtil.loadTerpeneDataMap(terpenes: TerpeneUtil.loadTerpenes()), searchTitle: "All Terpenes")
            }label: {
                FullWidthText(text: "View All Terpenes").padding()
            }

            
        }
    }
}

struct DiscoverTerpeneEffectsAromasRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverTerpeneEffectsAromasRow(terpene: TerpeneJSON.example)
    }
}
