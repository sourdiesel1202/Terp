//
//  ExploreView.swift
//  Flowr
//
//  Created by Andrew on 5/5/23.
//

import SwiftUI

struct DiscoverView: View {
    //    let
//    @EnvironmentObject var globalData: GlobalData
    @State var reload: Binding<Bool>
//    var terpeneData = [DataMap]
    private var terpeneProfile: TerpeneProfile {
        return TerpeneJSONUtil.loadTerpeneProfileByUser(user: User.example)
    }
    var body: some View {
        ScrollView{
            VStack{
                DiscoverHeaderRow().padding([.top, .bottom])
//                ViewDivider(height: 4)
                DiscoverRecommendedStrainsRow()
                ViewDivider(height: 4)
                DiscoverTerpeneEffectsAromasRow(terpene: TerpeneJSONUtil.loadTerpeneByName(name: terpeneProfile.terpenes[Int.random(in: 0..<self.terpeneProfile.terpenes.count)]))
                ViewDivider(height: 4)
                DiscoverAchievementRow()
            }
        }
//        NavigationStack {List {
//            //            ForEach(data) {(strain: Strain) in
//            NavigationLink {
//                RecommendedStrainsView()
//            } label: {
//                BasicRow(title: "Recommended Strains", description: "Discover recommened strains")
//                //                    StrainSearchRow(strain: strain)
//            }
//            NavigationLink {
//                ContentView()
////                ListView(data: TerpeneUtil.loadEffectDataMap(terpenes: TerpeneUtil.loadTerpenes()), searchTitle: "Search effects")
//            } label: {
//                BasicRow(title: "Strains by Effect", description: "Find strains by effect (i.e. anti-depressant, dry-mouth, etc)")
//                //                    StrainSearchRow(strain: strain)
//            }
//            NavigationLink {
////                ListView(data: TerpeneUtil.loadAromaDataMap(terpenes: globalData.terpenes, strains: globalData.strains), searchTitle: "Search aromas")
//            } label: {
//                BasicRow(title: "Strains by Aroma", description: "Find strains by aroma (i.e. earthy, grapefruit, diesel, etc)")
//                //                    StrainSearchRow(strain: strain)
//            }
//
//            NavigationLink {
//                ContentView()
//            } label: {
//                BasicRow(title: "Nearby Dispensaries", description: "Explore nearby dispensaries")
//                //                    StrainSearchRow(strain: strain)
//            }
//            //this is gonna be gross but I want to see if this works
////            ForEach(globalData.terpenes){terpene: Terpene}
//            NavigationLink {
//                ListView(data: TerpeneUtil.loadTerpeneDataMap(terpenes: TerpeneUtil.loadTerpenes()), searchTitle: "Search Terpenes")
//            } label: {
//                BasicRow(title: "Terpene List", description: "Learn about the different terepenes")
//                //                    StrainSearchRow(strain: strain)
//            }
//
//            //            }
//        }.navigationDestination(for: Strain.self) { strain in
//            StrainDetail2_0View(strain: strain)
//        }.toolbar {
//            ToolbarItem(placement: .principal) {
//                VStack {
//
//                    Text("Discover").font(.headline).padding(.top, 50)
//
////                    Text("Discover recommended strains, nearby dispensaries and more")
//                }
//            }
//        }
        }
    }
    
//    func loadTerpeneDataMap(terpenes: [Terpene]) -> [DataMap]{
//        var _terpenes = [DataMap]()
//        terpenes.forEach {
//            _terpenes.append(DataMap(key: $0.name, value: "", view: TerpeneDetailView(terpene: $0)))
//        }
//        return _terpenes
//    }
    
    

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(reload: .constant(false))
    }
}
