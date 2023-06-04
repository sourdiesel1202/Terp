//
//  MessagesView.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct MessagesView: View {
    let user: User
    var body: some View {
        
            List{
                ForEach(MessageUtil.loadUserMessageThreads(user: self.user)){ mThread in
                    NavigationLink{
                        MessagesRow(messageThread: mThread)
                    }label:{
                        MessageThreadRow(messageThread: mThread)}
                    
                }
            }.navigationTitle("Messages")
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView(user: User.example)
    }
}
