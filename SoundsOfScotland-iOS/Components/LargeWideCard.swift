//
//  LargeWideCard.swift
//  SoundsofScotland
//
//  Created by Brad on 06/09/2022.
//

import SwiftUI

struct LargeWideCard: View {
    @State var comingSoon: Bool = false
    var soundscape: Soundscape
    @EnvironmentObject var data : AppData
    
    var body: some View {
        Button {
                if (!comingSoon) {
                    data.soundscape = soundscape // set current soundscape to this one
                    data.selectedTab = Tab.nowPlaying // switch view to SceneView
                }
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Spacer()
                    Text(soundscape.title)
                        .customFont(.title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .layoutPriority(1)
                }
                .foregroundColor(.white)
                .padding(30)
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                
                .background(
                    Image(soundscape.image)
                        .resizable()
                        .scaledToFill()
                        .saturation(comingSoon ? 0 : 1)
                        .blur(radius: !comingSoon ? 0 : 5)
                )
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 12)
            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
        }
        
}
}

struct LargeWideCard_Previews: PreviewProvider {
    static var previews: some View {
        LargeWideCard(soundscape: soundscapes[0])
            .environmentObject(AppData())
    }
}
