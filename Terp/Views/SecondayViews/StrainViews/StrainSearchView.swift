//
//  SearchResult.swift
//  Flowr
//
//  Created by Andrew on 4/30/23.
//

import SwiftUI

struct StrainSearchView: View {
    @State private var searchText = ""
    @EnvironmentObject var globalData: GlobalData
//    @State var reload: Binding<Bool>
//    let strains: [Strain]
//    let searchTitle: String?
    var body: some View {
//        self.presentat
        if self.globalData.doubleTappedMainTabView || !self.globalData.doubleTappedMainTabView{
            NavigationView {
                if self.searchText.count < 3{
                    VStack{
                        Text("Search Cannabis Strains").font(.title).fontWeight(.bold)
                        Text("\(StrainJSONUtil.loadStrains().count) different strains found and counting").font(.subheadline)
                    }
                }else{
                    List {
                        ForEach(searchResults) {(strain: StrainJSON) in
                            
                            NavigationLink {
                                StrainDetail2_0View(strain: strain)
                            } label: {
                                StrainSearchResultRow(strain: strain)
                            }
                        }
                                                
                    }.navigationDestination(for: StrainJSON.self) { strain in
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
    }
    
    var searchResults: [StrainJSON] {
        if searchText.isEmpty || searchText.count < 3 {
                return [StrainJSON]()
            } else {
                if StrainJSONUtil.shouldUseCoreData(){
                    return StrainJSONUtil.convertCoreDataToJSON(strains: StrainCoreDataUtil.searchStrainsByName(name: self.searchText.lowercased()))
                }else{
                    return StrainJSONUtil.searchStrainByName(name: self.searchText)
                }
            }
        }

    
}

struct StrainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        StrainSearchView().environmentObject(GlobalData())
    }
}
