//
//  ProfileRow.swift
//  Flowr
//
//  Created by Andrew on 5/11/23.
//

import SwiftUI

struct SystemImageRow: View {
    let text: String
    let img: String
    var body: some View {
        HStack{
            Image(systemName: img)
            Text(text).font(.headline)
//            Text(description)
        }
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        SystemImageRow(text: "Andrew Smiley", img: "person.fill")
    }
}
