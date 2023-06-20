//
//  SearchResult.swift
//  Flowr
//
//  Created by Andrew on 4/30/23.
//

import SwiftUI
import CoreData
struct StrainSearchView: View {
    @State private var searchResults: [StrainJSON] = [StrainJSON]()
    @State private var searchText = ""
    @EnvironmentObject var globalData: GlobalData
    @State private var subTitle = ""

    @State private var loading: Bool = false
    var body: some View {
//        self.presentat
        if self.globalData.doubleTappedMainTabView || !self.globalData.doubleTappedMainTabView{
            NavigationView {
                if self.searchText.count < 3{
//                    if self.loading{} else{
//
//                    }
                    VStack{
                        Text("Search Cannabis Strains").font(.title).fontWeight(.bold)
                        if self.subTitle.count > 0{
                            Text(self.subTitle).font(.subheadline)
                        }else{
                            ProgressView()
                        }
                    }
                }else{
                    if self.loading{
                        ProgressView()
                    } else{
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
                }
            }.onAppear {
                DispatchQueue.global(qos: .utility).async {
                    let viewContext: NSManagedObjectContext = {
                        let newbackgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//                        let newbackgroundContext = PersistenceController.shared.container.newBackgroundContext()
                        newbackgroundContext.parent = PersistenceController.shared.container.viewContext
                        newbackgroundContext.automaticallyMergesChangesFromParent = true
                        return newbackgroundContext
                    }()
                    let newString = "\(StrainJSONUtil.loadStrains(viewContext: viewContext).count) different strains found and counting"
                    DispatchQueue.main.async {
                        self.subTitle = newString
                    }
                }
            }.searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),prompt: "search").disableAutocorrection(true).onChange(of: self.searchText){ newValue in
//                  print("foo")
                let viewContext: NSManagedObjectContext = {
                    let newbackgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//                    let newbackgroundContext = PersistenceController.shared.container.newBackgroundContext()
                    newbackgroundContext.parent = PersistenceController.shared.container.viewContext
                    newbackgroundContext.automaticallyMergesChangesFromParent = true
                    return newbackgroundContext
                }()
                if newValue.count >= 3{
                    self.loading = true
                    DispatchQueue.global(qos: .utility).async {
                        //                    let strainData = StrainJSONUtil.loadStrains()
                        let _searchResults = loadSearchResults(viewContext: viewContext)
                        DispatchQueue.main.async {
                            self.searchResults = _searchResults
                            //                        self.strains = strainData
                            self.loading = false
                        }
                    }
                }
            }
                
        }
    }
    
//    var searchResults: [StrainJSON] {
////        if searchText.isEmpty || searchText.count < 3 {
//                return [StrainJSON]()
//            } else {
//                return self.loadSearchResults()
//            }
//        }

    func loadSearchResults(viewContext: NSManagedObjectContext) -> [StrainJSON]{
            
                if StrainJSONUtil.shouldUseCoreData(viewContext: viewContext){
//                    DispatchQueue.global(qos: .utility).async {
//                        let strainData = StrainJSONUtil.loadStrains()
                      return  StrainJSONUtil.convertCoreDataToJSON(strains: StrainCoreDataUtil.searchStrainsByName(name: self.searchText.lowercased(), viewContext: viewContext))
                      
                }else{
                    return StrainJSONUtil.searchStrainByName(name: self.searchText, viewContext: viewContext)
                }
        
    }
    
}

struct StrainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        StrainSearchView().environmentObject(GlobalData())
    }
}
