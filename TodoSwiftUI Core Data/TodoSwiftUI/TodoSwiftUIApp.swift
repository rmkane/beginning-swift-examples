//
//  TodoSwiftUIApp.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI

@main
struct TodoSwiftUIApp: App {
    var body: some Scene {
        let persistenceContainer = PersistenceController.shared
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
