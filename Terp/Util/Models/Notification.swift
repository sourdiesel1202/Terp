//
//  Message.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
import SwiftUI


struct Notification: Codable, Identifiable, Hashable{
    enum CodingKeys: CodingKey{
        case id
        case type
        case content
//        case image
        case read
        case objectId
        case date
//        case messageThread
//        case from
//        case user
//        case content
//        case image
//        case date
//        case read
    }
    var uid = UUID()
    var id: String
    var type: String
    var content: String
//    var image: String
    var read: Bool
    var objectId: String?
    var date: String
//    var messageThread: MessageThread?
//    var from: User?
    
    
#if DEBUG
    static let example = Notification(id: "1234", type: "system", content: "This is a test notification",  read: false, date: "04-20-2023 15:50:46")//Message(id: "123456",user: User.example, content: "Test", image: "", date: "02-06-2023 15:56:02", read: false)
#endif
}
