//
//  MoreAccountRow.swift
//  Flowr
//
//  Created by Andrew on 5/26/23.
//

import SwiftUI

struct MoreAccountRow: View {
    var body: some View {
        
        Section(header: Text("Account Settings")){
                
                NavigationLink{
                    ContentView()
                }label:{
                    BasicRow(title: "Accont Settings", description: "Manage account settings")
                }
                
                NavigationLink{
                    ContentView()
                }label:{
                    BasicRow(title: "Post Settings", description: "Manage post settings")
                }
                NavigationLink{
                    EditProfileView(user: User.example)
                }label:{
                    BasicRow(title: "Edit Profile", description: "Edit your profile")
                }
                
            }
        
    }
}

struct MoreAccountRow_Previews: PreviewProvider {
    static var previews: some View {
        MoreAccountRow()
    }
}
