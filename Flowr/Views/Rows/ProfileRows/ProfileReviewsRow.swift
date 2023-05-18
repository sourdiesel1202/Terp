//
//  ProfileReviewsRow.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileReviewsRow: View {
    let user: User
    var body: some View {
        VStack{
            
        }
    }
    private var reviews: [Review] {
        return ReviewUtil.loadReviewsByUser(user: self.user)
    }
}

struct ProfileReviewsRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileReviewsRow(user: User.example)
    }
}
