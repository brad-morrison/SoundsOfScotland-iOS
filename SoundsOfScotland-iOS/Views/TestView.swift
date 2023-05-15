//
//  TestView.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI

struct TestView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Place.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Place.title, ascending: true)]) var places: FetchedResults<Place>
    
    var body: some View {
        ScrollView {
            VStack() {
                ForEach(places, id: \.self) { place in
                    VStack {
                        Text(place.title  ?? "a")
                        Image(place.image ?? "0")
                            .resizable()
                            .scaledToFill()
                    }
                    
                }
            }
        }
    }
    
    struct TestView_Previews: PreviewProvider {
        static var previews: some View {
            TestView()
        }
    }
}
