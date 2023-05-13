//
//  MainTabView.swift
//  Flowr
//
//  Created by Andrew on 5/5/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
           TabView {
               ContentView().tabItem{
                   Label("Feed", systemImage: "person.fill")
               }

               ExploreView().tabItem{
                   Label("Explore", systemImage: "globe.americas")
               }
               StrainSearchView()
                   .tabItem {
                       Label("Strains", systemImage: "magnifyingglass.circle")
                   }
               
               AccountView().tabItem{
                   Label("Account", systemImage: "person.fill")
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
        MainTabView()
//            .environmentObject()
    }
}
