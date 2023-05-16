//
//  FlowrApp.swift
//  Flowr
//
//  Created by Andrew on 4/30/23.
//

import SwiftUI

@main
struct FlowrApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var globalData = GlobalData()
    @StateObject var navigationUtil = NavigationUtil()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(GlobalData()).environmentObject(NavigationUtil())
        }
    }
}
