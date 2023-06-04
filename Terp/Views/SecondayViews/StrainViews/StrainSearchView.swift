//
//  SearchResult.swift
//  Flowr
//
//  Created by Andrew on 4/30/23.
//

import SwiftUI

struct StrainSearchView: View {
    @State private var searchText = ""
//    let strains: [Strain]
//    let searchTitle: String?
    var body: some View {
//        self.presentat
        NavigationView {
            if self.searchText.count < 3{
                VStack{
                    Text("Search Cannabis Strains").font(.title).fontWeight(.bold)
                    Text("\(StrainUtil.loadStrains().count) different strains found and counting").font(.subheadline)
                }
            }else{
                List {
                    ForEach(searchResults) {(strain: Strain) in
                        
                        NavigationLink {
                            StrainDetail2_0View(strain: strain)
                        } label: {
                            StrainSearchResultRow(strain: strain)
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
                }
            }.searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),prompt: "search")
    }
    
    var searchResults: [Strain] {
        if searchText.isEmpty || searchText.count < 3 {
                return [Strain]()
            } else {
                return StrainUtil.searchStrainByName(name: self.searchText)
            }
        }

    
}

struct StrainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        StrainSearchView()
    }
}
