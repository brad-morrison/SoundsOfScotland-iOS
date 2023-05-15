//
//  NewSection.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI

struct NewSection: View {
    
    var places: FetchedResults<Place>
    
    var body: some View {
        // title
        VStack(spacing: 0) {
            Text("New")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            // large featured cards
            LargeWideCard(soundscape: soundscapes[6], place: places[0])
                .padding(20)
        }
    }
}

/*
struct NewSection_Previews: PreviewProvider {
    static var previews: some View {
        NewSection()
    }
} */
