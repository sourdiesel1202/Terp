//
//  ProfileListView.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct ProfileListView: View {
    let profiles: [User]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView(profiles: [User.example])
    }
}
