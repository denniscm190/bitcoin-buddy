//
//  BitcoinBuddyApp.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 27/11/21.
//

import SwiftUI

@main
struct BitcoinBuddyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
