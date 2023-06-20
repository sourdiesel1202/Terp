//
//  SearchView.swift
//  Flowr
//
//  Created by Andrew on 5/29/23.
//

import SwiftUI
import CoreData

struct SearchView: View {
//    @State private var searchResults: [DataMap]
    @State private var searchText = ""
//    @State private var data: [DataMap] = [DataMap]()
    @State private var searchResults: [DataMap] = [DataMap]()
    @State private var loading: Bool = false
    @EnvironmentObject var errorHandler: ErrorHandler
    var body: some View {
        
        VStack{
            //        self.presentat
            if self.searchText.count < 3{
                //                    if self.loading{} else{
                //
                //                    }
                VStack{
                    Text("Search Terp").font(.title).fontWeight(.bold)
                    //                if self.subTitle.count > 0{
                    Text("Search all of Terp for strains, terpenes, aromas and more!").font(.subheadline)
                    Text("Use @ to search for users, # to search by post hashtag").font(.caption)
                    //                }else{
                    //                    ProgressView()
                    //                }
                }
                
            }else{
                if self.loading{
                    Text("Searching Terp").font(.title).fontWeight(.bold)
                    ProgressView()
                }else{
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
                        
                    }
                }
            }
        }.navigationDestination(for: DataMap.self) { dm in
            AnyView(dm.view)
            //        }.navigationDestination(for: StrainDetail.self) { strain in
            //            StrainDetail(strain: (strain: Strain))
            
            //        }.navigationTitle("Menu").navigationBarTitleDisplayMode(inline).listStyle(GroupedListStyle())
            //            //        .padding()
        }.navigationBarTitle("Search").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle()).searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),prompt: "Search across Terp").disableAutocorrection(true).onChange(of: self.searchText){ newValue in
            //convert to thread
            print(newValue)
            if newValue.count >= 3{
                self.loading = true
                DispatchQueue.global(qos: .utility).async {
                    //                    let strainData = StrainJSONUtil.loadStrains()
                    let _searchResults = loadSearchResults()
                    DispatchQueue.main.async {
                        self.searchResults = _searchResults
                        //                        self.strains = strainData
                        self.loading = false
                    }
                }
            }
        }
        
    }
    
    
    func loadSearchResults()->[DataMap]{
        if searchText.isEmpty {
            return [DataMap]()
        } else {
            if self.searchText.count < 3{
                return [DataMap]()
            }
            
            let viewContext: NSManagedObjectContext = {
                let newbackgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                newbackgroundContext.parent = PersistenceController.shared.container.viewContext
                newbackgroundContext.automaticallyMergesChangesFromParent = true
                return newbackgroundContext
            }()
            //ok so down here is where we will do the fancy stuff
            if self.searchText.hasPrefix("@"){ //user search
                return UserUtil.loadUserDataMap(users: UserUtil.searchUsersByUsername(username: self.searchText.replacingOccurrences(of: "@", with: "")))
            } else if self.searchText.hasPrefix("#"){ //post search
                return PostUtil.loadPostDataMap(posts: PostUtil.searchPostByHashtag(hashtag: searchText.replacingOccurrences(of: "#", with: "")))
            }else{
                
                // ok so here we're going to load strains, terpenes, aromas and effects
                var _res = [DataMap]()
                StrainJSONUtil.loadStrainDataMap(strains: StrainJSONUtil.searchStrainByName(name: self.searchText, viewContext: viewContext)).forEach(){ dm in
                    _res.append(dm)
                }
                //do terpenes next
                TerpeneJSONUtil.loadTerpeneDataMap(terpenes: TerpeneJSONUtil.searchTerpenesByName(name:   self.searchText, viewContext: viewContext)).forEach(){ dm in
                    _res.append(dm)
                }
                
//                    TerpeneUtil.search
                TerpeneJSONUtil.loadAromaEffectDataMap(data: TerpeneJSONUtil.searchEffects(query: self.searchText, viewContext: viewContext)).forEach(){ dm in
//                        dm.secondaryValue = "Aroma"
                    _res.append(DataMap(key: dm.key, value: dm.value, view: dm.view, secondaryValue: "Effect"))
                }
                TerpeneJSONUtil.loadAromaEffectDataMap(data: TerpeneJSONUtil.searchAromas(query: self.searchText, viewContext: viewContext)).forEach(){ dm in
                    _res.append(DataMap(key: dm.key, value: dm.value, view: dm.view, secondaryValue: "Aroma"))
                }
                return _res
            }
//                return data.filter { $0.key.lowercased().contains(searchText.lowercased())  ||  $0.value.lowercased().contains(searchText.lowercased()) }
        }
    }

}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
