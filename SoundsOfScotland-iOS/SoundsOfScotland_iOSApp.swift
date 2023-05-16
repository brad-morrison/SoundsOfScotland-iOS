//
//  SoundsOfScotland_iOSApp.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 08/09/2022.
//

import SwiftUI
import CoreData

@main
struct SoundsOfScotland_iOSApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    pop()
                }
        }
        .onChange(of: scenePhase) {  (newScenePhase) in
            //persistenceController.save()
        }
        
        
    }
    
    func pop() {
        for soundscape in soundscapes {
            let place = Place(context: persistenceController.container.viewContext)
            place.id = UUID()
            place.title = soundscape.title
            place.image = soundscape.image
            place.path = soundscape.path
            place.starred = soundscape.fav
        }
        do {
            try persistenceController.container.viewContext.save()
        } catch {
            // handle the Core Data error
            print("error saving from Add button")
        }
        print("built data")
    }
    
    
}
