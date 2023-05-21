//
//  ExploreSection.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import SwiftUI

struct ExploreSection: View {
    
    @StateObject private var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        VStack(spacing: 0) {
                    // title
                    Text("Explore")
                        .customFont(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    
                    // square cards
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.places) { place in
                            SquareCard(place: place)
                        }
                    }
                    .padding(20)
                }
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
}

struct ExploreSection_Previews: PreviewProvider {
    static var previews: some View {
        ExploreSection()
    }
}
