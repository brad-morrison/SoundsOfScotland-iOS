//
//  CoreDataListView.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 16/05/2023.
//

import SwiftUI
import CoreData

struct CoreDataListView: View {
    @EnvironmentObject var data : AppData
    @State private var showingAddScreen = false
    @StateObject private var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    
     var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.places) { place in
                        //Text(place.name ?? "def")
                        MediumCard(place: place)
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let place = viewModel.places[index]
                            viewModel.deletePlace(place)
                        }
                    })
                }
                
                
            }
            .navigationBarTitle("Places", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showingAddScreen.toggle()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Refresh") {
                        viewModel.fetchPlaces()
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddScreen) {
            AddPlaceView()
        }
        .onAppear(perform: {
            print("LOADED")
            viewModel.fetchPlaces()
            data.mostRecentTab = .categories
        })
    }
}

struct CoreDataListView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataListView()
            .environmentObject(AppData())
    }
}
