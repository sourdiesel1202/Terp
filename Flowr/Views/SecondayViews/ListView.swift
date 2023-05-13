//
//  DictionaryListView.swift
//  Flowr
// Another re-usable view to display a list using an input dict (keys are title, values are description
//  Created by Andrew on 5/13/23.
//

import SwiftUI

struct ListView: View {
    @State private var searchText = ""
    let data: [DataMap]
    var body: some View {
        NavigationStack {List {
            ForEach(data) {(dm: DataMap) in
                NavigationLink {
                    AnyView(dm.view)
                } label: {
                    
                    BasicRow(title: dm.key, description: dm.value)
                }
            }
        }.navigationDestination(for: DataMap.self) { dm in
            AnyView(dm.view)
            //        }.navigationDestination(for: StrainDetail.self) { strain in
            //            StrainDetail(strain: (strain: Strain))
                
            //        }.navigationTitle("Menu").navigationBarTitleDisplayMode(inline).listStyle(GroupedListStyle())
            //            //        .padding()
        }.navigationTitle("Search").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle())
            //        .padding()
        }.searchable(text: $searchText, prompt: "search")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(data: [DataMap(key: "Fuck", value: "A duck", view: ContentView())])
    }
}
