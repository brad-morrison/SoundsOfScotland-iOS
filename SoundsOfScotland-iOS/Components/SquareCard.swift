//
//  SquareCard.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI

struct SquareCard: View {
    var soundscape: Soundscape
    
    var body: some View {
        Button {} label: {
            HStack(spacing: 20) {
                VStack {
                    Spacer()
                    
                    Text(soundscape.title)
                            .customFont(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(30)
            .frame(width: .infinity, height: 180)
            .foregroundColor(.white)
            .background(
                soundscape.image
                    .resizable()
                    .scaledToFill()
            )
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 12)
        }
    }
}

struct SquareCard_Previews: PreviewProvider {
    static var previews: some View {
        SquareCard(soundscape: soundscapes[3])
    }
}
