//
//  NotificationRow.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct NotificationRow: View {
    let notification: Notification
    var body: some View {
        HStack{
        switch self.notification.type{
        case NotificationType.like.description:
            UserImageThumbnail(user: UserUtil.loadUserById(id: notification.objectId!)).frame(width: 90, height: 90)
        case NotificationType.follower.description:
            URLImage(url: UserUtil.loadUserById(id: notification.objectId!).image, shape: AnyShape(Circle())).frame(width: 90, height: 90)
            
        case NotificationType.system.description:
            Image(systemName: "bell").resizable().clipShape(Circle()).frame(width: 90, height: 90).scaledToFit()
//            URLImage(url: UserUtil.loadUserById(id: notification.objectId).image, shape: Circle()).frame(width: 90, height: 90)
        case NotificationType.comment.description:
            URLImage(url: UserUtil.loadUserById(id: PostUtil.loadPostById(id: notification.objectId!).review.user).image , shape: AnyShape(Circle())).frame(width: 90, height: 90)
        default:
            ContentView()
        }
            Text(notification.content).font(.headline)
            Spacer()
//            Image(systemName: "greaterthan").resizable().frame(width: 20, height: 20).padding([.trailing,.leading])
        }
    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow(notification: Notification.example)
    }
}
