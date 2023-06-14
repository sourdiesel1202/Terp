//
//  TerpApp.swift
//  Terp
//
//  Created by Andrew on 6/3/23.
//

import SwiftUI

@main
struct TerpApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var globalData = GlobalData()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(GlobalData()).withErrorHandling()
        }
    }
}
