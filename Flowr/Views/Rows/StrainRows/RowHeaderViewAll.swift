//
//  RowHeader.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct RowHeaderViewAll: View {
    let text: String
    var body: some View {
        HStack{
            Text(self.text).padding([.leading,.bottom]).font(.caption).fontWeight(.bold)
            Spacer()
            NavigationLink{
                ContentView()
            }label: {
                Text("View All").font(.caption).padding([.bottom,.trailing])
            }
            
        }
    }
}

struct RowHeaderViewAll_Previews: PreviewProvider {
    static var previews: some View {
        RowHeaderViewAll(text: "Terpene Profile")
    }
}
