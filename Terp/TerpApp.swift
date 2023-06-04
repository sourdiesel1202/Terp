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

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
