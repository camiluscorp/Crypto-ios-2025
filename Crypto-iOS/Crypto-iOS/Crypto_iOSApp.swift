//
//  Crypto_iOSApp.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 11/4/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    //base de datos local
    
    return true
  }
}


@main
struct Crypto_iOSApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //AssetList()
            AppTabView()
        }
    }
}
