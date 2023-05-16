//
//  ExploreSection.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI
import CoreData

struct ExploreSection: View {
    //@Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Place.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Place.title, ascending: true)]) var places: FetchedResults<Place>
    
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Explore")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            
            // square cards
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(places) { place in
                    SquareCard(place: place)
                }
            }
            .padding(20)
        }
    }
}

struct ExploreSection_Previews: PreviewProvider {
    static var previews: some View {
        ExploreSection()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
