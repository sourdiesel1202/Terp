//
//  MoreHeaderRow.swift
//  Flowr
//
//  Created by Andrew on 5/26/23.
//

import SwiftUI

struct MoreHeaderRow: View {
    var body: some View {
        VStack{
            Text("More").fontWeight(.bold).font(.title)
            Text("Manage Terp Settings, Modify Preferences, Etc")
            
        }.padding()
    }
}

struct MoreHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        MoreHeaderRow()
    }
}
