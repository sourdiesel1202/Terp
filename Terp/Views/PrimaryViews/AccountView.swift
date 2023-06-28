//
//  ProfileView.swift
//  Flowr
//
//  Created by Andrew on 5/11/23.
//

import SwiftUI

struct AccountView: View {
    
//    @EnvironmentObject var globalData: GlobalData
//    @EnvironmentObject var navigationUtil: NavigationUtil
    @State private var popToRoot =  false
    @State private var showingBuildTerpeneProfile: Bool = false
//    @State var should = true
    @State var showAromaHelp = true
    @State var showEffectHelp = true
    @State private var path = NavigationPath()
    @State var navigationController = UINavigationController()
//    @State var show = true
//    @State var show = true
    var body: some View {
        
//        Image(sysemName: img)
        List {
            //            ForEach(data) {(strain: Strain) in
            NavigationLink {
                ContentView()
//                AccountSettingsView(user: User.example)
            } label: {
                BasicRow(title: "Account Settings", description: "Account Settings")
                //                    StrainSearchRow(strain: strain)
            }
            
            NavigationLink {
                TerpeneProfileView(user: User.example, terpeneProfile: TerpeneJSONUtil.loadTerpeneProfileByUser(user: User.example))
                
            } label: {
                BasicRow(title: "Build Terpene Profile", description: "Build your terpene profile")
                //                    StrainSearchRow(strain: strain)
            }//.isDetailLink(self.navigationUtil.isNavigationStackActive)
            NavigationLink {
                ContentView()
            } label: {
                BasicRow(title: "View Your Achievements", description: "View your achievement list")
                //                    StrainSearchRow(strain: strain)
            }
            NavigationLink {
                ListView(data: AchievementUtil.loadAchievementDataMap(), searchTitle: "Search Achievements")
            } label: {
                BasicRow(title: "View All Achievements", description: "View all achievements")
                //                    StrainSearchRow(strain: strain)
            }
            NavigationLink {
                ContentView()
            } label: {
                BasicRow(title: "Manage Circle", description: "Manage Followers/Following")
                //                    StrainSearchRow(strain: strain)
            }
            NavigationLink {
                ContentView()
            } label: {
                BasicRow(title: "Help", description: "Get Help")
                //                    StrainSearchRow(strain: strain)
            }
            //            }
        }.toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    
                    Text("Account").font(.headline).padding(.top, 50)
                    
                    //                    Text("Discover recommended strains, nearby dispensaries and more")
                }
            }
        }
        }
        
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
