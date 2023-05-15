//
//  RecentSection.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI

struct RecentSection: View {
    var places: FetchedResults<Place>
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Recent")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            
            // vertical medium cards
            VStack(spacing: 20) {
                MediumCard(soundscape: soundscapes[2], place: places[3])
                MediumCard(soundscape: soundscapes[6], place: places[12])
                MediumCard(soundscape: soundscapes[4], place: places[1])
            }
            .padding(20)
        }
    }
}

/*
struct RecentSection_Previews: PreviewProvider {
    static var previews: some View {
        RecentSection()
    }
}*/
