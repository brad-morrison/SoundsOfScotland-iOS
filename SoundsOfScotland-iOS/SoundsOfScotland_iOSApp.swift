//
//  SoundsOfScotland_iOSApp.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 08/09/2022.
//

import SwiftUI

@main
struct SoundsOfScotland_iOSApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) {  (newScenePhase) in
            //persistenceController.save()
        }
        
    }
    
    
}
