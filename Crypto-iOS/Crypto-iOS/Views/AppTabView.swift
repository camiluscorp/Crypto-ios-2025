//
//  AppTabView.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 12/4/25.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        //Text("Tab View")
        TabView {
            Tab ("Home", systemImage: "house") {
                AssetList()
            }
            Tab ("Favourites", systemImage: "star") {
                    Text ("Favourites")
            }
            Tab ("Settings", systemImage: "gear") {
                   SettingsView()
            }
            
            
            
//            Tab ("Settings", systemImage: "gear") {
//                Text ("Settings")
//            }
//            Tab ("Settings", systemImage: "gear") {
//                Text ("Settings")
//            }
//            Tab ("Settings", systemImage: "gear") {
//                Text ("Settings")
//            }
//            Tab ("Settings", systemImage: "gear") {
//                Text ("Settings")
//            }
        }
    }
}

#Preview {
    AppTabView()
}
