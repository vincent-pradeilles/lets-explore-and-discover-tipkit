//
//  DiscoveringTipKitApp.swift
//  DiscoveringTipKit
//
//  Created by Vincent on 10/08/2023.
//

import SwiftUI
import TipKit

@main
struct DiscoveringTipKitApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                SwiftUIView()
                    .tabItem {
                        Text("SwiftUI")
                    }
                
                ViewController_SwiftUI()
                    .tabItem {
                        Text("UIKit")
                    }
            }
                .task {
                    // Configure and load your tips at app launch.
                    try? await Tips.configure {
                        DisplayFrequency(.immediate)
                        DatastoreLocation(.applicationDefault, shouldReset: true)
                    }
                }
        }
    }
}
