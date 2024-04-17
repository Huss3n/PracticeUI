//
//  PracticeUIApp.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 02/04/2024.
//

import SwiftUI
import SwiftfulRouting

@main
struct PracticeUIApp: App {
    @Environment(\.router) var router
    
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}
