//
//  ExploreRow.swift
//  Flowr
//
//  Created by Andrew on 5/6/23.
//

import SwiftUI

struct BasicRow: Row, View {
    var title: String
    var description: String
    var body: some View {
        VStack(alignment: .leading){
            Text(title).font(.headline)
            Text(description)
        }
    }
}

struct BasicRow_Previews: PreviewProvider {
    static var previews: some View {
        BasicRow(title: "Test", description: "A test description")
    }
}
