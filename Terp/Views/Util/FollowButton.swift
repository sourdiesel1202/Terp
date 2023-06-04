//
//  FollowButton.swift
//  Flowr
//
//  Created by Andrew on 5/26/23.
//

import SwiftUI

struct FollowMessageButton: View {
    let user: User
    let text: String
    let action: ()->Void
    var body: some View {
            Text(self.text).font(.caption2).fontWeight(.bold).padding().background(.blue)
                .foregroundColor(.white)
                .clipShape(
                    
                    // 2
                    Capsule()
                ).padding([.leading, .trailing])
    }
}

struct FollowMessageButton_Previews: PreviewProvider {
    static var previews: some View {
        FollowMessageButton(user: User.example,text: "Message",action: {})
    }
}
