//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Ryan Michael Kane on 8/23/22.
//

import SwiftUI
import Firebase

@main
struct NotesAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
