//
//  SearchView.swift
//  Flowr
//
//  Created by Andrew on 5/29/23.
//

import SwiftUI

struct SearchView: View {
//    @State private var searchResults: [DataMap]
    @State private var searchText = ""
    @State private var data: [DataMap] = [DataMap]()
//    let searchTitle: String?
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
        }.navigationBarTitle("Search").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle()).searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),prompt: "search")
    }
    
    var searchResults: [DataMap] {
            if searchText.isEmpty {
                return data
            } else {
                if self.searchText.count < 2{
                    return [DataMap]()
                }
                
                //ok so down here is where we will do the fancy stuff
                if self.searchText.hasPrefix("@"){ //user search
                    return UserUtil.loadUserDataMap(users: UserUtil.searchUsersByUsername(username: self.searchText.replacingOccurrences(of: "@", with: "")))
                } else if self.searchText.hasPrefix("#"){ //post search
                    return PostUtil.loadPostDataMap(posts: PostUtil.searchPostByHashtag(hashtag: searchText.replacingOccurrences(of: "#", with: "")))
                }
                return data.filter { $0.key.lowercased().contains(searchText.lowercased())  ||  $0.value.lowercased().contains(searchText.lowercased()) }
            }
        }


}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
