//
//  ViewModel.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import Foundation
import CoreData
import AuthenticationServices
import Firebase
import FirebaseAuth
import CryptoKit

class ViewModel : ObservableObject {
    @Published var places: [PlaceEntity] = []
    private let context: NSManagedObjectContext
    private var currentNonce: String = ""
    private var errorMessage: String = ""
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchPlaces()
    }
    
    func fetchPlaces() {
        do {
            let request: NSFetchRequest<PlaceEntity> = PlaceEntity.fetchRequest()
            places = try context.fetch(request)
            print("Fetch successful")
        } catch {
            print("Error fetching places - \(error.localizedDescription)")
        }
    }
    
    func addPlace(name: String, image: String, path: String, starred: Bool) {
        let newPlace = PlaceEntity(context: context)
        newPlace.name = name
        newPlace.image = image
        newPlace.path = path
        newPlace.starred = starred
        print("adding \(name) to CoreData")
        saveContext()
        fetchPlaces()
    }
    
    func deletePlace(_ place: PlaceEntity) {
        context.delete(place)
        print("deleted \(place.name ?? "") from CoreData")
        do {
            try context.save()
            print("Saved after delete")
        } catch {
            print("Failed to save after delete")
        }
        //saveContext()
    }
    
    func saveContext() {
        do {
            try context.save()
            print("CoreData saved successfully!")
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
    
    func deleteAllData() {
        for place in places {
            deletePlace(place)
        }
    }
    
    func setStarred(state: Bool, place: PlaceEntity) {
        place.starred = state
        do {
            try context.save()
            print("Starred saved successfully!")
        } catch {
            print("Error saving context after edit: \(error.localizedDescription)")
        }
        fetchPlaces()
    }
    
    func resetData() {

        deleteAllData()
        print("Stores are empty, building base data")
        addPlace(name: "Loch Ness Shores", image: "0", path: "audioFile", starred: false)
        addPlace(name: "Tentsmuir Forest", image: "1", path: "tentsmuir_forest", starred: true)
        addPlace(name: "Edinburgh Festival", image: "2", path: "tentsmuir_forest", starred: false)
        addPlace(name: "Stormy West Sands", image: "3", path: "tentsmuir_forest", starred: false)
        addPlace(name: "Glencoe Valley", image: "4", path: "tentsmuir_forest", starred: false)
        addPlace(name: "Braemar Meadow", image: "5", path: "tentsmuir_forest", starred: false)
        addPlace(name: "Fairy Pools", image: "6", path: "tentsmuir_forest", starred: false)
    }
    
    func dataTestPopulate() {
        let placesList = ["Loch Ness Shores", "Tentsmuir Forest", "Edinburgh Festival", "Stormy West Sands", "Glencoe Valley", "Braemar Meadow", "Fairy Pools"]
        
        if (placesList.count == 0) {
            resetData()
        } else {
            for place in places {
                if (!placesList.contains(place.name ?? "")) {
                    deletePlace(place)
                }
            }
        }
    }
}
