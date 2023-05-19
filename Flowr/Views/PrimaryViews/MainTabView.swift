//
//  MainTabView.swift
//  Flowr
//
//  Created by Andrew on 5/5/23.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        
           TabView {
               FeedView().tabItem{
                   Label("Feed", systemImage: "person.fill")
               }

               ListView(data: StrainUtil.loadStrainDataMap(strains: globalData.strains), searchTitle: "Search Strains")
//               StrainSearchView()
                   .tabItem {
                       Label("Search Strains", systemImage: "magnifyingglass.circle")
                   }
               
               DiscoverView().tabItem{
                   Label("Discover", systemImage: "globe.americas")
               }
               
               NavigationView{ProfileView(user: UserUtil.loadUserById(id: "42069")!)}.tabItem{
                   Label("Profile", systemImage: "person.fill")
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
        MainTabView().environmentObject(GlobalData())
//            .environmentObject()
    }
}
