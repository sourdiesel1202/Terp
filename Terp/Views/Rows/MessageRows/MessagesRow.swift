//
//  MessagesRow.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct MessagesRow: View {
    @State var messageThread: MessageThread
    @State private var messageContent: String = ""
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center){
                Button(action: {}){
                    NavigationLink{
                        ProfileView(user: self.messageThread.user)
                    } label: {
                        UserImageThumbnail(user: self.messageThread.user).frame(width: 200, height: 200)
                        
                    }
                }.padding()
                Text("\(self.messageThread.user.username)").font(.headline).fontWeight(.bold).padding(.bottom)
                
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
                
//                Spacer().padding(.bottom).padding(.bottom)
//                Spacer().padding(.bottom).padding(.bottom)
            }
            
            HStack{
                KeyboardTextField(hint: "Chatting with @\(messageThread.user.username)", buttonText: "Send", text: self.$messageContent, action: {
                    let m = Message(id: String(Int.random(in: 5000...10000)), user: User.example, content: self.messageContent, image:
                                "", date: "\(Date.now)", read: true)
                    self.messageThread.messages.append(m)
                    self.messageContent = ""
                })
            }.safeAreaInset(edge: .top, content: {})
        }
        
        
        }
}

struct MessagesRow_Previews: PreviewProvider {
    static var previews: some View {
        MessagesRow(messageThread: MessageThread.example)
    }
}
