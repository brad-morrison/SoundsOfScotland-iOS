//
//  RoundCard.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import SwiftUI

struct RoundCard: View {
    @EnvironmentObject var data : AppData
    var place: PlaceEntity
    
    var body: some View {
        Button {
                       
                       data.place = place // set current soundscape to this one
                       data.selectedTab = Tab.nowPlaying // switch view to SceneView
                       
                   } label: {
                       VStack {
                           Image(place.image ?? "0")
                               .resizable()
                               .scaledToFill()
                               .frame(width: 120, height: 120)
                               .mask(Circle())
                               .shadow(color: data.shadows ? .black.opacity(0.3) : .black.opacity(0), radius: 8, x: 0, y: 12)
                           
                           Text(place.name ?? "error")
                               .multilineTextAlignment(.center)
                               .customFont(.subheadline2)
                               .frame(maxWidth: 100, alignment: .center)
                               .fixedSize(horizontal: false, vertical: true)
                       }
               }
                .buttonStyle(PlainButtonStyle()) // Apply plain button style
    }
}

struct RoundCard_Previews: PreviewProvider {
    static var previews: some View {
        RoundCard(place: dummyPlace())
            .environmentObject(AppData())
    }
}
