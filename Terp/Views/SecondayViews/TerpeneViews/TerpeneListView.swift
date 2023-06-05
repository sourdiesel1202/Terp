//
//  TerpeneListView.swift
//  Flowr
//
//  Created by Andrew on 5/12/23.
//

import SwiftUI

struct TerpeneListView: View {
    
    @State private var searchText = ""
    let data = Bundle.main.decode([TerpeneJSON].self, from: "terpene.json")
    var body: some View {
        NavigationStack {List {
            ForEach(data) {(terpene: TerpeneJSON) in
                NavigationLink {
                    TerpeneDetailView(terpene: terpene)
                } label: {
                    
                    BasicRow(title: terpene.name, description: "")
                }
            }
        }.navigationDestination(for: TerpeneJSON.self) { terpene in
            TerpeneDetailView(terpene: terpene)
            //        }.navigationDestination(for: StrainDetail.self) { strain in
            //            StrainDetail(strain: (strain: Strain))
                
            //        }.navigationTitle("Menu").navigationBarTitleDisplayMode(inline).listStyle(GroupedListStyle())
            //            //        .padding()
        }.navigationTitle("Search").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle())
            //        .padding()
        }.searchable(text: $searchText, prompt: "search")
    }
}

struct TerpeneListView_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneListView()
    }
}
