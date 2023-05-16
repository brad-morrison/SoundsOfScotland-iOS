//
//  TrySection.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI
import CoreData

struct TrySection: View {
    //@Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Place.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Place.title, ascending: true)]) var places: FetchedResults<Place>
    
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Try something new")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            // round cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(places) { place in
                        RoundCard(place: place)
                    }
                }
                .padding(20)
                .padding(.bottom, 30)
            }
        }
    }
}

struct TrySection_Previews: PreviewProvider {
    static var previews: some View {
        TrySection()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
