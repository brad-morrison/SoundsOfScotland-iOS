//
//  LargeCard.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI

struct LargeCard: View {
    var soundscape: Soundscape
    var body: some View {
        Button {} label:  {
            VStack(alignment: .leading, spacing: 8) {
                
                Spacer()
                Text(soundscape.title)
                    .customFont(.title2)
                    .frame(maxWidth: 170, alignment: .leading)
                    .layoutPriority(1)
            }
            .foregroundColor(.white)
            .padding(30)
            .frame(width: 260, height: 310)
            
            .background(
                soundscape.image
                    .resizable()
                    .scaledToFill()
            )
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
        }
        
        
    }
}


struct LargeCard_Previews: PreviewProvider {
    static var previews: some View {
        LargeCard(soundscape: soundscapes[0])
    }
}
