//
//  SecondBrainApp.swift
//  SecondBrain
//
//  Created by Elliott on 16.12.2024.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct SecondBrainApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
