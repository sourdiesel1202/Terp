//
//  NotificationUtil.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import Foundation
import SwiftUI
struct NotificationUtil {
    static func loadUserNotifications(user: User) -> [Notification]{
        return Bundle.main.decode([Notification].self, from: "notifications.json")
    }
    static func loadNotificationDestination(notification: Notification) -> any View{
        switch notification.type{
        case NotificationType.comment.description:
            return CommentView(post: PostUtil.loadPostById(id: notification.objectId!), replyingTo: Comment.example)
        case NotificationType.system.description:
            return ContentView()
        case NotificationType.follower.description:
            return ProfileView(user: UserUtil.loadUserById(id: notification.objectId!))
        case NotificationType.like.description:
            return PostDetailView(post: PostUtil.loadPostById(id: notification.objectId!))
//            return CommentView(post: PostUtil.loadPostById(id: notification.objectId!), replyingTo: Comment.example)
        default:
            return ContentView()
        }
//        return ContentView()
    }
    
}
