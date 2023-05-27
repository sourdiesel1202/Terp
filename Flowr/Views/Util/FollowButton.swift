//
//  FollowButton.swift
//  Flowr
//
//  Created by Andrew on 5/26/23.
//

import SwiftUI

struct FollowButton: View {
    let user: User
    var body: some View {
        Button(action:{}){
            Text("Follow").font(.caption2).fontWeight(.bold).padding().background(.blue)
                .foregroundColor(.white)
                .clipShape(
                    
                    // 2
                    Capsule()
                ).padding([.leading, .trailing])
        }
    }
}

struct FollowButton_Previews: PreviewProvider {
    static var previews: some View {
        FollowButton(user: User.example)
    }
}
