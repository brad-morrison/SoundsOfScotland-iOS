//
//  CoreDataDisplayView.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 16/05/2023.
//

import SwiftUI
import CoreData

struct CoreDataDisplayView: View {
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Place.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Place.title, ascending: true)]) var places: FetchedResults<Place>
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    let place = Place(context: managedObjectContext)
                    place.id = UUID()
                    place.title = "new place"
                    place.image = "0"
                    place.path = "path"
                    place.starred = false
                    PersistenceController.shared.save()
                } label: {
                    Text("Add")
                }
                .padding()
                Button {
                    deleteAll()
                } label: {
                    Text("Clear")
                }
                .padding()
            }
            List {
                ForEach(places) { place in
                    Text(place.title ?? "error")
                }
                .onDelete(perform: removePlace)
            }
        }
        
    }
    
    func removePlace(at offsets: IndexSet) {
        print("start - places has \(places.count) entries")
        withAnimation {
            offsets.map { places[$0] }.forEach(managedObjectContext.delete)

            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        print("end - places has \(places.count) entries")
    }
    
    func deleteAll() {
        for place in places {
            managedObjectContext.delete(place)
        }
        do {
            try managedObjectContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct CoreDataDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataDisplayView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
