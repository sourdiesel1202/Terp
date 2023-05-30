//
//  MessagesRow.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct MessagesRow: View {
    let messageThread: MessageThread
    var body: some View {
        VStack(alignment: .center){
            UserImageThumbnail(user: self.messageThread.user).frame(width: 200, height: 200)
            Text("\(self.messageThread.user.username)").font(.headline).fontWeight(.bold)
            ScrollView(.vertical){
                //            Spacer()
                ForEach(self.messageThread.messages){ message in
                    HStack{
                        if message.user.id == User.example.id{
                            Spacer()
                            Text(message.content).padding().background(Color(UIColor.systemBlue)).clipShape(ChatBubble(sendingMessage: true)).foregroundColor(.white)
                        }else{
                            Text(message.content).padding().foregroundColor(.primary).background(Color.secondary.opacity(0.2)).clipShape(ChatBubble(sendingMessage: false))
                            Spacer()
                            //                    Spacer()
                        }
                    }.padding([.trailing,.leading])
                }
            }
        }
    }
}

struct MessagesRow_Previews: PreviewProvider {
    static var previews: some View {
        MessagesRow(messageThread: MessageThread.example)
    }
}
