//
//  DiscoverTerpeneEffectsAromasRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct DiscoverTerpeneEffectsAromasRow: View {
    let terpene: TerpeneJSON
    @State var loading: Bool = true
    @State private var aromas: [EffectAromaJSON] = [EffectAromaJSON]()
    @State private var effects: [EffectAromaJSON] = [EffectAromaJSON]()
    @State private var terpenes: [TerpeneJSON] = [TerpeneJSON]()
//    private var terpeneSection: some View{
//
//    }
    var body: some View {
        VStack{
            if self.loading{
                ProgressView()
                
            }else{
            Text("Explore Your Terpene Profile").padding([.top,.bottom]).fontWeight(.bold).font(.title)
            VStack{
                RowHeaderViewAll(text: "Explore Effects of \(terpene.name)",data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.terpene.effects))
                HorizontalTerpeneEffectAromaRow(data: self.terpene.effects)
                NavigationLink{
                    ThumbnailListView(data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.effects), searchTitle: "All Terpene Effects (\(self.effects.count)")
                }label: {
                    FullWidthText(text: "View All Terpene Effects").padding()
                }
            }
            //            VStack{
            //                ViewDivider(height: 0.25)
            //                RowHeaderViewAll(text: "Explore Other Aromas of \(terpene.name)", data: TerpeneJSONUtil.loadAromaDataMap(aromas: TerpeneJSONUtil.loadTerpeneAromas(terpenes: [self.terpene])))
            //                HorizontalTerpeneEffectAromaRow(data: TerpeneJSONUtil.loadTerpeneAromas(terpenes: [self.terpene] ))
            //                NavigationLink{
            //                    ThumbnailListView(data: TerpeneJSONUtil.loadTerpeneAromas(terpenes: TerpeneJSONUtil.loadTerpenes()), searchTitle: "All Terpene Aromas")
            //                }label: {
            //                    FullWidthText(text: "View All Terpene Aromas").padding()
            //                }
            //            }
            //            ViewDivider(height: 0.25)
            VStack{
                RowHeaderViewAll(text: "Explore Aromas of \(terpene.name)",data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.terpene.aromas))
                HorizontalTerpeneEffectAromaRow(data: self.terpene.aromas)
                NavigationLink{
                    ThumbnailListView(data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.aromas), searchTitle: "All Terpene Aromas (\(self.aromas.count))")
                }label: {
                    FullWidthText(text: "View All Terpene Effects").padding()
                }
            }
            VStack{
                ViewDivider(height: 0.25)
                RowHeaderViewAll(text: "Terpenes similar to \(terpene.name)", data:TerpeneJSONUtil.loadTerpeneDataMap(terpenes: self.terpenes))
                HorizontalTerpeneRow(terpenes:  self.terpenes)
                NavigationLink{
                    ThumbnailListView(data: TerpeneJSONUtil.loadTerpeneDataMap(terpenes:self.terpenes), searchTitle: "All Terpenes (\(self.terpenes.count))")
                }label: {
                    FullWidthText(text: "View All Terpenes").padding()
                }
                
                
            }}
        }.onAppear{
            DispatchQueue.global(qos: .utility).async {
//                    let strainData = StrainJSONUtil.loadStrains()
//                let _searchResults = loadSearchResults()
                let terpenes = TerpeneJSONUtil.loadTerpenes()
                let aromas = TerpeneJSONUtil.loadAromaJSON()
                let effects = TerpeneJSONUtil.loadEffectJSON()
//                let parents = StrainJSONUtil.loadStrainParents(strain: self.strain)
//                let children = StrainJSONUtil.loadStrainChildren(strain: self.strain)
                DispatchQueue.main.async {
                    self.terpenes = terpenes
                    self.aromas = aromas
                    self.effects = effects
//                    self.children = children/
//                    self.parents = parents
//                    self.searchResults = _searchResults
//                        self.strains = strainData
                    self.loading = false
                }
            }
        }
    }
}

struct DiscoverTerpeneEffectsAromasRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverTerpeneEffectsAromasRow(terpene: TerpeneJSON.example)
    }
}
