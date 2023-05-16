//
//  RecentSection.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI
import CoreData

struct RecentSection: View {
    //@Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Place.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Place.title, ascending: true)]) var places: FetchedResults<Place>
    
    
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Recent")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            
            // vertical medium cards
            VStack(spacing: 20) {
                MediumCard(place: places[0])
                MediumCard(place: places[1])
                MediumCard(place: places[2])
            }
            .padding(20)
        }
    }
}


struct RecentSection_Previews: PreviewProvider {
    static var previews: some View {
        RecentSection()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
