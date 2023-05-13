//
//  RoundCard.swift
//  SoundsofScotland
//
//  Created by Brad on 06/09/2022.
//

import SwiftUI

struct RoundCard: View {
    var soundscape: Soundscape
    @EnvironmentObject var data : AppData
    
    var body: some View {
        
            Button {
                
                data.soundscape = soundscape // set current soundscape to this one
                data.selectedTab = Tab.nowPlaying // switch view to SceneView
                
            } label: {
                VStack {
                    soundscape.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .mask(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 12)
                    
                    Text(soundscape.title)
                        .multilineTextAlignment(.center)
                        .customFont(.subheadline2)
                        .frame(maxWidth: 100, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                }
        }
        
    }
}

struct RoundCard_Previews: PreviewProvider {
    static var previews: some View {
        RoundCard(soundscape: soundscapes[0])
    }
}
