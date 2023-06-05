//
//  Message.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
import SwiftUI


struct Message: Codable, Identifiable, Hashable{
    enum CodingKeys: CodingKey{
        case id
        case user
        case content
        case image
        case date
        case read
    }
    var uid = UUID()
    var id: String
    var user: User
    var content: String
    var image: String
    var date: String
    var read: Bool
    
#if DEBUG
    static let example = Message(id: "123456",user: User.example, content: "Test", image: "", date: "02-06-2023 15:56:02", read: false)
#endif
}
