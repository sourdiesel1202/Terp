//
//  NotificationsView.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView(.vertical){
            Text("Notifications").font(.title).fontWeight(.bold)
            VStack(alignment: .leading){
                ForEach(NotificationUtil.loadUserNotifications(user: User.example)){ notification in
//                    Button(action: {}){
                                            NavigationLink{
                                                AnyView(NotificationUtil.loadNotificationDestination(notification: notification))
                                            }label:{
                        NotificationRow(notification: notification)
                        
                                            }
                        
//                    }
                    ViewDivider(height: 0.25)
                }
                
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
