//
//  MessageThreadRow.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct MessageThreadRow: View {
    let messageThread: MessageThread
    var body: some View {
        VStack(alignment:.leading ){
            HStack(alignment: .center){
                UserImageThumbnail(user: self.messageThread.user).frame(width: 70, height: 70)
                VStack(alignment: .leading){
                    Text(self.messageThread.user.username).fontWeight(.bold)
                    Text(self.messageThread.messages.last!.content)
                    
                }.padding(.leading)
                if messageThread.messages.contains(where: {$0.read==false}){
                    Image(systemName: "circle.fill").frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemBlue))
//                    SystemImageRow(text: )
                }
            }
        }
    }
}

struct MessageThreadRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageThreadRow(messageThread: MessageThread.example)
    }
}
