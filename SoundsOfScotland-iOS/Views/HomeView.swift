//
//  HomeView.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @State var sceneIsOpen = false
    
    //@Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Place.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Place.title, ascending: true)]) var places: FetchedResults<Place>
    
    var body: some View {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        //NewSection()
                        //FeaturedSection()
                        //RecentSection()
                        //TrySection()
                        //ExploreSection()
                        //ComingSoonSection()
                        
                    }
                    .padding(.top, 130)
                }
            }
            .ignoresSafeArea()
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
        
    }
        
let columns = [
    GridItem(.flexible(), spacing: 20),
    GridItem(.flexible(), spacing: 20)
]

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .background(Color("Background Light"))
            .previewInterfaceOrientation(.portrait)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
