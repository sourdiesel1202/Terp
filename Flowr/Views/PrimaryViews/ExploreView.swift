//
//  ExploreView.swift
//  Flowr
//
//  Created by Andrew on 5/5/23.
//

import SwiftUI

struct ExploreView: View {
    //    let
    @EnvironmentObject var globalData: GlobalData
//    @State var terpeneList: [DataMap]
//    var terpeneData = [DataMap]
    
    var body: some View {
//        globalData.terpenes.forEach {
//            terpeneList.append(DataMap(key: $0.name, value: $0.description, view: TerpeneDetailView(terpene: $0)))
//        }
//        ForEach(globalData.terpenes) { datum in
//            terpeneData.append()
//        }
        //        VStack(alignment: .leading){
        //            VStack{
        //                Text("Recommended Strains").font(.headline)
        //
        //                Text("Recommended Strains")
        //            }
        //        }
        
        NavigationStack {List {
            //            ForEach(data) {(strain: Strain) in
            NavigationLink {
                RecommendedStrainsView()
            } label: {
                BasicRow(title: "Recommended Strains", description: "Discover recommened strains")
                //                    StrainSearchRow(strain: strain)
            }
            NavigationLink {
                ListView(data: TerpeneUtil.loadEffectDataMap(terpenes: globalData.terpenes, strains: globalData.strains), searchTitle: "Search effects")
            } label: {
                BasicRow(title: "Strains by Effect", description: "Find strains by effect (i.e. anti-depressant, dry-mouth, etc)")
                //                    StrainSearchRow(strain: strain)
            }
            NavigationLink {
                ListView(data: TerpeneUtil.loadAromaDataMap(terpenes: globalData.terpenes, strains: globalData.strains), searchTitle: "Search aromas")
            } label: {
                BasicRow(title: "Strains by Aroma", description: "Find strains by aroma (i.e. earthy, grapefruit, diesel, etc)")
                //                    StrainSearchRow(strain: strain)
            }
            
            NavigationLink {
                ContentView()
            } label: {
                BasicRow(title: "Nearby Dispensaries", description: "Explore nearby dispensaries")
                //                    StrainSearchRow(strain: strain)
            }
            //this is gonna be gross but I want to see if this works
//            ForEach(globalData.terpenes){terpene: Terpene}
            NavigationLink {
                ListView(data: TerpeneUtil.loadTerpeneDataMap(terpenes: globalData.terpenes), searchTitle: "Search Terpenes")
            } label: {
                BasicRow(title: "Terpene List", description: "Learn about the different terepenes")
                //                    StrainSearchRow(strain: strain)
            }
            
            //            }
        }.navigationDestination(for: Strain.self) { strain in
            StrainDetailView(strain: strain)
        }.toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    
                    Text("Explore").font(.headline).padding(.top, 50)
                    
//                    Text("Discover recommended strains, nearby dispensaries and more")
                }
            }
        }
        }
    }
    
//    func loadTerpeneDataMap(terpenes: [Terpene]) -> [DataMap]{
//        var _terpenes = [DataMap]()
//        terpenes.forEach {
//            _terpenes.append(DataMap(key: $0.name, value: "", view: TerpeneDetailView(terpene: $0)))
//        }
//        return _terpenes
//    }
    
    
}
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView().environmentObject(GlobalData())
    }
}
