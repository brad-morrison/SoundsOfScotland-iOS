//
//  ComingSoonSection.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI

struct ComingSoonSection: View {
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Coming Soon")
                .multilineTextAlignment(.center)
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 20)
            
            // large featured cards
            //LargeWideCard(comingSoon: true, soundscape: soundscapes[7], places: nil)
            //.padding(20)
        }
        .padding(.bottom, 110)
    }
}

struct ComingSoonSection_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonSection()
    }
}
