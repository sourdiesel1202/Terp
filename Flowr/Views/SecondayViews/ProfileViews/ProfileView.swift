//
//  ProfileView.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var body: some View {
        ScrollView(.vertical){
            
                VStack(alignment: .center){
                    ProfileHeaderRow(user: self.user)
                    //                ViewDivider(height: 2)
                    ProfileReviewsRow(user: self.user)
                    ProfileTerpeneRow(user: self.user)
                    //                Text("")
                    ViewDivider(height: 2)
                    ProfileAchievemenstRow(user: self.user)
                    ViewDivider(height: 2)
                    ProfileCircleRow(user: self.user)
                    ViewDivider(height: 2)
                    ProfileFeedRow(user: self.user)
                    ViewDivider(height: 2)
                }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.example)
    }
}
