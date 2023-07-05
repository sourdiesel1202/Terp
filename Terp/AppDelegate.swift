//
//  AppDelegate.swift
//  Terp
//
//  Created by Andrew on 7/5/23.
//

import Foundation
import SwiftUI 
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("App Delegate was called")
        // init s3
        S3Util.initializeS3()
        return true
    }
}
