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
            RowHeaderViewAll(text: "Explore Other Effects of \(terpene.name)",data: TerpeneJSONUtil.loadAromaEffectDataMap(data: TerpeneJSONUtil.loadTerpeneEffects(terpenes: [self.terpene])))
            HorizontalTerpeneEffectAromaRow(data: TerpeneJSONUtil.loadTerpeneEffects(terpenes: [self.terpene] ))
            NavigationLink{
                ThumbnailListView(data: TerpeneJSONUtil.loadTerpeneEffects(terpenes: TerpeneJSONUtil.loadTerpenes()), searchTitle: "All Terpene Effects")
            }label: {
                FullWidthText(text: "View All Terpene Effects").padding()
            }
        }
            VStack{
                ViewDivider(height: 0.25)
                RowHeaderViewAll(text: "Explore Other Aromas of \(terpene.name)", data: TerpeneJSONUtil.loadAromaDataMap(aromas: TerpeneJSONUtil.loadTerpeneAromas(terpenes: [self.terpene])))
                HorizontalTerpeneEffectAromaRow(data: TerpeneJSONUtil.loadTerpeneAromas(terpenes: [self.terpene] ))
                NavigationLink{
                    ThumbnailListView(data: TerpeneJSONUtil.loadTerpeneAromas(terpenes: TerpeneJSONUtil.loadTerpenes()), searchTitle: "All Terpene Aromas")
                }label: {
                    FullWidthText(text: "View All Terpene Aromas").padding()
                }
            }
//            ViewDivider(height: 0.25)
        VStack{
            ViewDivider(height: 0.25)
            RowHeaderViewAll(text: "Terpenes similar to \(terpene.name)", data:TerpeneJSONUtil.loadTerpeneDataMap(terpenes: TerpeneJSONUtil.loadTerpenes()))
            HorizontalTerpeneEffectAromaRow(data: TerpeneJSONUtil.loadTerpeneAromas(terpenes: [self.terpene] ))
            NavigationLink{
                ThumbnailListView(data: TerpeneJSONUtil.loadTerpeneDataMap(terpenes: TerpeneJSONUtil.loadTerpenes()), searchTitle: "All Terpenes")
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
