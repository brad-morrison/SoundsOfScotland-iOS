//
//  FeaturedSection.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI

struct FeaturedSection: View {
    var places: FetchedResults<Place>
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Featured")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            // large featured cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(places) { place in
                        LargeCard(place: place)
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
        }
    }
}

/*
struct FeaturedSection_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedSection()
    }
}*/
