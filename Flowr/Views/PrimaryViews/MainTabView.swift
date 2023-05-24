//
//  MainTabView.swift
//  Flowr
//
//  Created by Andrew on 5/5/23.
//

import SwiftUI

struct MainTabView: View {
//    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        
           TabView {
               NavigationView{FeedView()}.tabItem{
                   Label("Feed", systemImage: "house.fill")
               }
               NavigationView{ProfileView(user: UserUtil.loadUserById(id: "42069")!)}.tabItem{
                   Label("Profile", systemImage: "person.fill")
               }
//               ListView(data: StrainUtil.loadStrainDataMap(strains: globalData.strains), searchTitle: "Search Strains")
//               StrainSearchView()
               
               
               NavigationView{StrainSearchView(strains: StrainUtil.loadStrains())}.tabItem {
                       Label("Strain Search", systemImage: "magnifyingglass.circle")
                   }
               
               NavigationView{DiscoverView()}.tabItem{
                   Label("Discover", systemImage: "globe.americas")
               }
               
               
               NavigationView{ContentView()}.tabItem{
                   Label("More", systemImage: "ellipsis")
               }
               

//               OrderView()
//                   .tabItem {
//                       Label("Order", systemImage: "square.and.pencil")
//                   }
           }
       }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()//.environmentObject(GlobalData())
//            .environmentObject()
    }
}
