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
                TerpeneProfileView(user: User.example, terpeneProfile: TerpeneJSONUtil.loadTerpeneProfileByUser(user: User.example))
            }label:{
                BasicRow(title: "Edit Terpene Profile", description: "Edit your terpene profile")
            }
            
            
        }
        
    }
}

struct MoreTerpeneRow_Previews: PreviewProvider {
    static var previews: some View {
        MoreTerpeneRow()
    }
}
