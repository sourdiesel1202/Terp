//
//  ShowInPublicFeedHelpView.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct ShowInPublicFeedHelpView: View {
    var body: some View {
        VStack{
            Text("Public Visibility").font(.title).fontWeight(.bold).padding()
            Text("If you enable public visibility for this review, your post will be visible for all users from the feed tab. This means your profile will also be visible to all users, unless you have set your profile to private").padding()
        }
    }
}

struct ShowInPublicFeedHelpView_Previews: PreviewProvider {
    static var previews: some View {
        ShowInPublicFeedHelpView()
    }
}
