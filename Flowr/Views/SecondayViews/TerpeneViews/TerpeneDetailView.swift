//
//  TerpeneDetailView.swift
//  Flowr
//
//  Created by Andrew on 5/12/23.
//

import SwiftUI

struct TerpeneDetailView: View {
    let terpene: Terpene
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center){
                TerpeneDetailHeaderRow(terpene: self.terpene)
            }
        ViewDivider(height: 4)
            VStack (alignment: .leading){
                TerpeneDetailStrainRow(terpene: self.terpene)
                ViewDivider(height: 0.25)
                TerpeneDetailEffectAromaRow(terpene: self.terpene)
                
                
                
                //            if terpene..count==0{
                
                //todo add list of strains with this terepene
                
                //            NavigationStack {List {
                //                //            ForEach(data) {(strain: Strain) in
                //                NavigationLink {
                //                    StrainListView(data: Bundle.main.searchStrainByTerpene(terpene: terpene))
                //                } label: {
                //
                //                    BasicRow(title: "Strains Containing \(terpene.name)", description: "Discover strains containing \(terpene.name)")
                //                    //                    StrainSearchRow(strain: strain)
                //                }
                //
                //                NavigationLink {
                //                    ListView(data: self.loadTerpeneEffects(), searchTitle: "Search Effects")
                ////
                //
                //                } label: {
                //                    BasicRow(title: "View Effects", description: "Discover the effects of \(terpene.name)")
                //                    //                    StrainSearchRow(strain: strain)
                //                }
                //
                //                NavigationLink {
                //                    ListView(data: self.loadTerpeneAromas(), searchTitle: "Search Aromas")
                //                } label: {
                //                    BasicRow(title: "View Aromas", description: "Explore the aromas of \(terpene.name)")
                //                    //                    StrainSearchRow(strain: strain)
                //                }
                //                //            }
                //            }.navigationTitle("More").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle())
                //            }
            }
        }
    }
    
    func loadTerpeneEffects()->[DataMap]{
        var effects = [DataMap]()
        self.terpene.effects.forEach {
            effects.append(DataMap(key: $0, value: "", view: ContentWithTitleDescView(title: $0, desc: $0, image: nil)))
        }
        return effects
    }
    
    func loadTerpeneAromas()->[DataMap]{
        var aromas = [DataMap]()
        self.terpene.aromas.forEach {
            aromas.append(DataMap(key: $0, value: "", view: ContentWithTitleDescView(title: $0, desc: $0, image: nil)))
        }
        return aromas
    }
}

struct TerpeneDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneDetailView(terpene: Terpene.example)
    }
}
