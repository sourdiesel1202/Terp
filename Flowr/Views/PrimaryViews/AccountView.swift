//
//  ProfileView.swift
//  Flowr
//
//  Created by Andrew on 5/11/23.
//

import SwiftUI

struct AccountView: View {
    
    var body: some View {
        
//        Image(systemName: img)
        NavigationStack {List {
            //            ForEach(data) {(strain: Strain) in
            NavigationLink {
                AccountSettingsView()
            } label: {
                BasicRow(title: "Account Settings", description: "Account Settings")
                //                    StrainSearchRow(strain: strain)
            }
            
            NavigationLink {
                ContentView()
            } label: {
                BasicRow(title: "Edit Terpene Profile", description: "Modify your terpene profile")
                //                    StrainSearchRow(strain: strain)
            }
            NavigationLink {
                ContentView()
            } label: {
                BasicRow(title: "View Badges", description: "View your badge list")
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
