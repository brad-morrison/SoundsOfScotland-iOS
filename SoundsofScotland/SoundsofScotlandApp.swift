//
//  SoundsofScotlandApp.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 16/05/2023.
//

import SwiftUI
import CoreData

@main
struct SoundsofScotlandApp: App {
    // instance of coredata storage
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
