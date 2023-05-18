//
//  ProfileHeaderRpw.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileHeaderRow: View {
    let user: User
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center){
                
                
                
                Image(systemName: "person.circle").resizable().scaledToFit().clipped().frame(width: 200, height: 200)
                Text(user.username).padding(.top).fontWeight(.bold).font(.headline)
                Text("\(user.firstname) \(user.lastname)").font(.subheadline)
            }
        }
    }
}

struct ProfileHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderRow(user: User.example)
    }
}
