//
//  TodoApp.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 7/11/23.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct TodoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        // Adding the swift Data Model to the App
        .modelContainer(for: Work.self)
    }
}
//MARK: Initializing Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        if let clientID = FirebaseApp.app()?.options.clientID{
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
        }
        
        return true
    }
    //MARK: Initialize Phone Auth remote notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        return .noData
    }
    
}
