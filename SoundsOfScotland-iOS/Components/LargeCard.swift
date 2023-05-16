//
//  LargeCard.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI

struct LargeCard: View {
    //var soundscape: Soundscape
    @EnvironmentObject var data : AppData
    var place: Place
    var body: some View {
        
            Button {
                
                data.place = place // set current soundscape to this one
                data.selectedTab = Tab.nowPlaying // switch view to SceneView
                
            } label:  {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Spacer()
                    Text(place.title ?? "def")
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
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 12)
                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
        }
        
        
        
    }
}


struct LargeCard_Previews: PreviewProvider {
    static var previews: some View {
        LargeCard(place: dummyPlace())
            .environmentObject(AppData())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



