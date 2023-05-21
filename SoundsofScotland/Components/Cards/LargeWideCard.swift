//
//  LargeWideCard.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import SwiftUI

struct LargeWideCard: View {
    @EnvironmentObject var data : AppData
    @State var comingSoon: Bool = false
    var place: PlaceEntity
    
    var body: some View {
        Button {
            if (!comingSoon) {
                data.place = place // set current soundscape to this one
                data.selectedTab = Tab.nowPlaying // switch view to SceneView
            }
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                
                Spacer()
                Text(place.name ?? "a")
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .layoutPriority(1)
            }
            .foregroundColor(.white)
            .padding(30)
            .frame(maxWidth: .infinity)
            .frame(height: 240)
            
            .background(
                Image(place.image  ?? "a")
                    .resizable()
                    .scaledToFill()
                    .saturation(comingSoon ? 0 : 1)
                    .blur(radius: !comingSoon ? 0 : 5)
            )
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: data.shadows ? .black.opacity(0.3) : .black.opacity(0), radius: 8, x: 0, y: 12)
            .shadow(color: data.shadows ? .black.opacity(0.3) : .black.opacity(0), radius: 2, x: 0, y: 1)
        }
    }
}

struct LargeWideCard_Previews: PreviewProvider {
    static var previews: some View {
        LargeWideCard(place: dummyPlace())
            .environmentObject(AppData())
    }
}
