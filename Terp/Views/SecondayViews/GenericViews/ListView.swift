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
    let searchTitle: String?
    var body: some View {
//        self.presentat
        NavigationView {List {
            ForEach(searchResults) {(dm: DataMap) in
                
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
        }.navigationBarTitle(searchTitle ?? "Search").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle())
            //        .padding()
        }.searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),prompt: "search")
    }
    
    var searchResults: [DataMap] {
            if searchText.isEmpty {
                return data
            } else {
                return data.filter { $0.key.lowercased().contains(searchText.lowercased())  ||  $0.value.lowercased().contains(searchText.lowercased()) }
            }
        }

    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(data: [DataMap(key: "Fuck", value: "A duck", view: ContentView())], searchTitle: "Search Me")
    }
}
