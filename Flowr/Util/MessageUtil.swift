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
