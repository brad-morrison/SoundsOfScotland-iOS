//
//  LargeCard.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import SwiftUI

struct LargeCard: View {
    @EnvironmentObject var data : AppData
    var place: PlaceEntity
    
    var body: some View {
        
        Button {
            
            data.place = place // set current soundscape to this one
            data.selectedTab = Tab.nowPlaying // switch view to SceneView
            
        } label:  {
            VStack(alignment: .leading, spacing: 8) {
                
                Spacer()
                Text(place.name ?? "def")
                    .customFont(.title2)
                    .frame(maxWidth: 170, alignment: .leading)
                    .layoutPriority(1)
            }
            .foregroundColor(.white)
            .padding(30)
            .frame(width: 260, height: 310)
            
            .background(
                Image(place.image ?? "def")
                    .resizable()
                    .scaledToFill()
            )
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: data.shadows ? .black.opacity(0.3) : .black.opacity(0), radius: 8, x: 0, y: 12)
            .shadow(color: data.shadows ? .black.opacity(0.3) : .black.opacity(0), radius: 2, x: 0, y: 1)
        }
    }
}

struct LargeCard_Previews: PreviewProvider {
    static var previews: some View {
        LargeCard(place: dummyPlace())
    }
}
