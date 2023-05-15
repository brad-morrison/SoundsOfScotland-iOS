//
//  ExploreSection.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI

struct ExploreSection: View {
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Explore")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            
            // square cards
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(soundscapes) { soundscape in
                    SquareCard(soundscape: soundscape)
                }
            }
            .padding(20)
        }
    }
}

struct ExploreSection_Previews: PreviewProvider {
    static var previews: some View {
        ExploreSection()
    }
}
