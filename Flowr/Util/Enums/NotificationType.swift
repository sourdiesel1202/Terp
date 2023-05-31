//
//  NotificationType.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import Foundation

enum NotificationType: CaseIterable, Identifiable{
    case like
    case comment
    case follower
    case system
//    case flower
//    case concentrates
//    case hashish
//    case edibles
    var id: Self { self }
    var description: String {
        
        switch self {
        case .like:
            return "like"
        case .comment:
            return "comment"
        case .follower:
            return "follower"
        case .system:
            return "system"
        }
    }
}
