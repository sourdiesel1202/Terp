//
//  RowHeader.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct RowHeader: View {
    let text: String
    var body: some View {
        HStack(alignment: .top){
            Text(self.text).padding([.leading,.bottom]).font(.caption).fontWeight(.bold)
            Spacer()
        }
    }
}

struct RowHeader_Previews: PreviewProvider {
    static var previews: some View {
        RowHeader(text: "Terpene Profile")
    }
}
