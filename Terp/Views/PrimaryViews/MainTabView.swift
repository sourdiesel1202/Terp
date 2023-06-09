//
//  MainTabView.swift
//  Flowr
//
//  Created by Andrew on 5/5/23.
//

import SwiftUI
import CoreData
struct MainTabView: View {
//    @EnvironmentObject var globalData: GlobalData
    @Environment(\.managedObjectContext) private var viewContext
    @State var reload: Bool = false
//    @EnvironmentObject var globalData: GlobalData
//    @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
//    @FetchRequest(sortDescriptors: []) var effects: FetchedResults<Effect>
//    @FetchRequest(sortDescriptors: []) var terpenes: FetchedResults<Terpene>
    @State private var selectedTab: Tab = .feed
    var body: some View {
        
        
        TabView(selection: self.$selectedTab) {
               NavigationView{FeedView()}.tabItem{
                   Label("Feed", systemImage: "house.fill")
               }.tag(Tab.feed)
               NavigationView{ProfileView(user: User.example)}.tabItem{
                   Label("Profile", systemImage: "person.fill")
               }.tag(Tab.profile)
            NavigationView{StrainSearchView()}.tabItem {
                       Label("Strain Search", systemImage: "magnifyingglass.circle")
               }.tag(Tab.search)
               
            NavigationView{DiscoverView(reload: self.$reload)}.tabItem{
                   Label("Discover", systemImage: "globe.americas")
               }.tag(Tab.discover)
               
//               /Users/andrew/XcodeProjects/Terp/Terp/Preview Content
               MoreView().tabItem{
                   Label("More", systemImage: "ellipsis")
               }.tag(Tab.more).onTapGesture(count: 2){
                   print("moreview tapped twice")
                   self.selectedTab = .more
               }
               

//               OrderView()
//                   .tabItem {
//                       Label("Order", systemImage: "square.and.pencil")
//                   }
           }.onTapGesture(count: 2){
               self.reload.toggle()
//               globalData.doubleTappedMainTabView.toggle()
               print("Something tapped twice")
               
               switch self.selectedTab{
                case Tab.feed:
                   self.selectedTab = Tab.feed
               case Tab.more:
                   self.selectedTab = Tab.more
               case Tab.profile:
                   self.selectedTab = Tab.profile
               case Tab.discover:
                   self.selectedTab = Tab.discover
               case Tab.search:
                   self.selectedTab = Tab.search

               }
           }.onAppear(perform: {
//               StrainCoreDataUtil.deleteStrains(viewContext: self.viewContext)
                TerpeneCoreDataUtil.buildAromaCoreData(viewContext: self.viewContext)
                TerpeneCoreDataUtil.buildEffectCoreData(viewContext: self.viewContext)
                TerpeneCoreDataUtil.buildTerpeneCoreData(viewContext: self.viewContext)
                StrainCoreDataUtil.buildStrainCoreData()
               //ok so here is where we need to load in our data into core data if it doesn't exist
//               DispatchQueue.global(qos: .userInteractive).async {
//                 // fetch animation based on status
//                 // on global background thread so as not to block the main thread
////                 let animation = getAnimation(status)
//                 DispatchQueue.main.async {
//                   // show animation on main thead as it is a UI update
////                   self?.showAnimation(animation)
////                     print("Clearing old data")
////                     TerpeneCoreDataUtil.deleteAromas(viewContext: self.viewContext)ega
////                     TerpeneCoreDataUtil.deleteEffects(viewContext: self.viewContext)
////                     TerpeneCoreDataUtil.deleteTerepenes(viewContext: self.viewContext)
////                     StrainCoreDataUtil.deleteStrains(viewContext: self.viewContext)
//                     print("Loading data")
//                     TerpeneCoreDataUtil.buildAromaCoreData(viewContext: self.viewContext)
//                     TerpeneCoreDataUtil.buildEffectCoreData(viewContext: self.viewContext)
//                     TerpeneCoreDataUtil.buildTerpeneCoreData(viewContext: self.viewContext)
//                     StrainCoreDataUtil.buildStrainCoreData(viewContext: self.viewContext)
//
//                 }
//               }
               
           })
       
    
    
    
    }
}
extension MainTabView {
    enum Tab: Hashable {
        case feed
        case profile
        case search
        case discover
        case more
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView().environmentObject(GlobalData())
//            .environmentObject()
    }
}
