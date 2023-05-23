//
//  SearchResult.swift
//  Flowr
//
//  Created by Andrew on 4/30/23.
//

import SwiftUI

struct StrainSearchView: View {
    @State private var searchText = ""
    let strains: [Strain]
//    let searchTitle: String?
    var body: some View {
//        self.presentat
        NavigationView {List {
            ForEach(searchResults) {(strain: Strain) in
                
                NavigationLink {
                    StrainDetail2_0View(strain: strain)
                } label: {
                    StrainSearchRow(strain: strain)
                }
            }
                                    
        }.navigationDestination(for: Strain.self) { strain in
            StrainDetail2_0View(strain: strain)
            //        }.navigationDestination(for: StrainDetail.self) { strain in
            //            StrainDetail(strain: (strain: Strain))
                
            //        }.navigationTitle("Menu").navigationBarTitleDisplayMode(inline).listStyle(GroupedListStyle())
            //            //        .padding()
        }.navigationBarTitle("Search").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle())
            //        .padding()
        }.searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),prompt: "search")
    }
    
    var searchResults: [Strain] {
            if searchText.isEmpty {
                return strains
            } else {
                return strains.filter { $0.name.lowercased().contains(searchText.lowercased())  ||  $0.description.lowercased().contains(searchText.lowercased()) }
            }
        }

    
}

struct StrainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        StrainSearchView(strains: StrainUtil.loadStrains())
    }
}
