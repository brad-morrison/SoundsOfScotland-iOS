//
//  MediumCard.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import SwiftUI

struct MediumCard: View {
    @EnvironmentObject var data : AppData
    var place: PlaceEntity
    
    var body: some View {
        Button {
            
            data.place = place // set current soundscape to this one
            data.selectedTab = Tab.nowPlaying // switch view to SceneView
            
        } label:  {
            HStack(spacing: 20) {
                Text(place.name ?? "")
                    .customFont(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(30)
            .frame(maxWidth: .infinity, maxHeight: 110)
            .foregroundColor(.white)
            .background(
                Image(place.image ?? "")
                    .resizable()
                    .scaledToFill()
            )
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: data.shadows ? .black.opacity(0.3) : .black.opacity(0), radius: 8, x: 0, y: 12)
        }
    }
}

struct MediumCard_Previews: PreviewProvider {
    static var previews: some View {
        MediumCard(place: dummyPlace())
    }
}

func dummyPlace() -> PlaceEntity {
    let place = PlaceEntity(context: PersistenceController.shared.container.viewContext)
    place.name = "dummy"
    place.image = "0"
    place.path = "a"
    return place
}
