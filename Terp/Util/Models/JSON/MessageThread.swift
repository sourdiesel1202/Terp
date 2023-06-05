//
//  MessageThread.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import Foundation

struct MessageThread: Codable, Identifiable, Hashable{
    enum CodingKeys: CodingKey{
        case id
        case user
        case messages
        
    }
    var uid = UUID()
    var id: String
    var user: User
    var messages: [Message]
    
    
#if DEBUG
    static let example = MessageThread(id: "123456",user: User.example, messages: [Message.example])
#endif
}
