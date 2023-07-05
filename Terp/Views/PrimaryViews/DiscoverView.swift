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
//    @State var reload: Binding<Bool>
//    var terpeneData = [DataMap]
    @State private var loading: Bool = true
    private var terpeneProfile: TerpeneProfile {
//        DispatchQueue.global(qos: .utility).async {
            return TerpeneJSONUtil.loadTerpeneProfileByUser(user: User.example)
//        }
    }
    var body: some View {
//        ProgressView()
        ScrollView{
            VStack{
                DiscoverHeaderRow().padding([.top, .bottom])
//                ViewDivider(height: 4)
                DiscoverRecommendedStrainsRow()
//                ViewDivider(height: 4)
                DiscoverTerpeneEffectsAromasRow(terpene: TerpeneJSONUtil.loadTerpeneByName(name: terpeneProfile.terpenes[Int.random(in: 0..<self.terpeneProfile.terpenes.count)], viewContext: PersistenceController.shared.container.viewContext))
//                ViewDivider(height: 4)
                DiscoverAchievementRow()
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
    
    

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
