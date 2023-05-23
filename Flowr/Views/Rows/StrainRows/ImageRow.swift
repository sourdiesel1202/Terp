//
//  ImageRow.swift
//  Flowr
//
//  Created by Andrew on 5/15/23.
//

import SwiftUI
struct ImageRow: Row, View {
    var title: String
    
    var description: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        ImageRow(title: "Title", description: "Description")
    }
}
