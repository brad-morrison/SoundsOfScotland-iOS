//
//  TrySection.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 14/05/2023.
//

import SwiftUI

struct TrySection: View {
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
                    ForEach(soundscapes) { soundscape in
                        RoundCard(soundscape: soundscape)
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
    }
}
