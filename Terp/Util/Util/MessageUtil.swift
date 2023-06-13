//
//  MessageUtil.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//
import Foundation
struct MessageUtil {
    static func loadUserMessageThreads(user: User) -> [MessageThread]{
        return Bundle.main.decode([MessageThread].self, from: "messages.json")
    }
    static func sendMessage(messageThread: MessageThread, message: Message){
        
    }
    static func generateMessageThreadId()-> String{
        return "123\(Int.random(in: 50...100))"
    }
    static func loadMessageThreadByUser(user: User, target: User) -> MessageThread{
        if loadUserMessageThreads(user: user).filter({$0.user.id == target.id}).count == 0{
            return MessageThread(id: generateMessageThreadId(), user: target, messages: [Message]())
        } else{
            return loadUserMessageThreads(user: user).filter({$0.user.id == target.id}).first!
        }
    }
}
//import SwiftUI
//
//struct MessageUtil: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct MessageUtil_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageUtil()
//    }
//}
