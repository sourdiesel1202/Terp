//
//  StrainListView.swift
//  Flowr
//
//  Created by Andrew on 5/12/23.
//

import SwiftUI

struct StrainListView: View {
    //ok so the idea here is that we can re-use this view by passing in a listing of strains
    @State private var searchText = ""
    let data: [StrainJSON]
    var body: some View {
//        NavigationStack {List {
        ForEach(data) {(strain: StrainJSON) in
            NavigationLink {
                StrainDetail2_0View(strain: strain)
            } label: {
                
                StrainSearchRow(strain: strain)
            }
            //            }
            //        }.navigationDestination(for: Strain.self) { strain in
            //            StrainDetail2_0View(strain: strain)
            //        }.navigationDestination(for: StrainDetail.self) { strain in
            //            StrainDetail(strain: (strain: Strain))
            
            //        }.navigationTitle("Menu").navigationBarTitleDisplayMode(inline).listStyle(GroupedListStyle())
            //            //            //        .padding()
            //        }.navigationTitle("Search").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle())
            //            //        .padding()
            //        }.searchable(text: $searchText, prompt: "search for strains")
        }
    }
}

struct StrainListView_Previews: PreviewProvider {
    static var previews: some View {
        StrainListView( data: [StrainJSON.example])
    }
}
