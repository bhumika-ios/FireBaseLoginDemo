//
//  FireBaseLoginDemoApp.swift
//  FireBaseLoginDemo
//
//  Created by Bhumika Patel on 25/11/23.
//

import SwiftUI
import FirebaseCore

@main
struct FireBaseLoginDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:  [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
