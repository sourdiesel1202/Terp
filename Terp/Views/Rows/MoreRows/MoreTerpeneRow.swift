//
//  MoreTerpeneRow.swift
//  Flowr
//
//  Created by Andrew on 5/26/23.
//

import SwiftUI

struct MoreTerpeneRow: View {
    @State private var dumb: String = ""
    var body: some View {
        Section(header: Text("Terp Settings")){
            NavigationLink{
                ContentView()
            }label:{
                BasicRow(title: "Edit Terpene Profile", description: "Edit your terpene profile")
            }
            
            NavigationLink{
                ContentView()
            }label:{
                BasicRow(title: "Strain Settings", description: "Manage strain settings")
            }
            NavigationLink{
                KeyboardTextField(hint: "Sending message to @whosgonnausehername", buttonText: "Send", text: self.$dumb)
            }label:{
                BasicRow(title: "Strain Settings", description: "Manage strain settings")
            }
//            NavigationLink{
//                ContentView()
//            }label:{
//                BasicRow(title: "Exclude Aromas", description: "")
//            }
        }
        
    }
}

struct MoreTerpeneRow_Previews: PreviewProvider {
    static var previews: some View {
        MoreTerpeneRow()
    }
}
