//
//  MediumCard.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI

struct MediumCard: View {
    var soundscape: Soundscape
    var place: Place
    @EnvironmentObject var data : AppData
    
    var body: some View {
            Button {
                
                data.soundscape = soundscape // set current soundscape to this one
                data.selectedTab = Tab.nowPlaying // switch view to SceneView
                
            } label:  {
                HStack(spacing: 20) {
                    Text(place.title ?? "a")
                            .customFont(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(30)
                .frame(maxWidth: .infinity, maxHeight: 110)
                .foregroundColor(.white)
                .background(
                    Image(place.image ?? "a")
                        .resizable()
                        .scaledToFill()
                )
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 12)
        }
        
    }
}

/*
struct MediumCard_Previews: PreviewProvider {
    static var previews: some View {
        MediumCard(soundscape: soundscapes[0])
    }
}*/
