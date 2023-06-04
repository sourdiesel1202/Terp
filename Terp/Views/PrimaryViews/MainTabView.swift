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
               NavigationView{ProfileView(user: User.example)}.tabItem{
                   Label("Profile", systemImage: "person.fill")
               }
               NavigationView{StrainSearchView()}.tabItem {
                       Label("Strain Search", systemImage: "magnifyingglass.circle")
                   }
               
               NavigationView{DiscoverView()}.tabItem{
                   Label("Discover", systemImage: "globe.americas")
               }
               
               
               MoreView().tabItem{
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
