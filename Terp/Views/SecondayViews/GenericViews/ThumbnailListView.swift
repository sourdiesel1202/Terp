//
//  ThumbnailListView.swift
//  Flowr
//
//  Created by Andrew on 5/24/23.
//

import SwiftUI

struct ThumbnailListView: View {
    
    @State private var searchText = ""
    let data: [DataMap]
    let searchTitle: String?
    var body: some View {
//        self.presentat
        List {
            ForEach(searchResults) {(dm: DataMap) in
                
                NavigationLink {
                    AnyView(dm.view)
                } label: {
                    if dm.secondaryValue != nil{
                        if dm.image != nil{
                            ImageRow(title: dm.key, description: dm.value, secondaryDescription: dm.secondaryValue, image: dm.image)
                        }else{
                            ImageRow(title: dm.key, description: dm.value, secondaryDescription: dm.secondaryValue)
                        }
                    }else{
                        if dm.image != nil{
                            ImageRow(title: dm.key, description: dm.value, image: dm.image)
                        }else{
                            ImageRow(title: dm.key, description: dm.value)
                        }
                    }
//                    BasicRow(title: dm.key, description: dm.value)
//                    ImageRow(title: <#T##String#>, description: <#T##String#>)
                }
            }
        }.navigationDestination(for: DataMap.self) { dm in
            AnyView(dm.view)
            //        }.navigationDestination(for: StrainDetail.self) { strain in
            //            StrainDetail(strain: (strain: Strain))
                
            //        }.navigationTitle("Menu").navigationBarTitleDisplayMode(inline).listStyle(GroupedListStyle())
            //            //        .padding()
        }.navigationBarTitle(searchTitle ?? "Search").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle()).searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),prompt: "search")
    }
    
    var searchResults: [DataMap] {
            if searchText.isEmpty {
                return data
            } else {
                return data.filter { $0.key.lowercased().contains(searchText.lowercased())  ||  $0.value.lowercased().contains(searchText.lowercased()) }
            }
        }

}

struct ThumbnailListView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailListView(data: TerpeneJSONUtil.loadTerpeneDataMap(terpenes: TerpeneJSONUtil.loadTerpenes()), searchTitle: "Terpenes")
    }
}
