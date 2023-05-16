//
//  NowPlayingBar.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 11/05/2023.
//

import SwiftUI

struct NowPlayingBar: View {
    @EnvironmentObject var data : AppData
    var body: some View {
        
            HStack {
                PlayButton(size: 6, iconSize: 20)
                Text("Now Playing")
                    .customFont(.footnote2)
                Spacer()
                Text(data.place.title ?? "error")
            }
            .foregroundColor(.white)
            .frame(height: 300, alignment: .topLeading)
            .padding(.horizontal, 25)
            .padding(.vertical, 13)
            .background {
                Image(data.place.image ?? "0")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 3)
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .onTapGesture {
                data.selectedTab = .nowPlaying
            }
        }
    
    
    
}



struct NowPlayingBar_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingBar()
            .environmentObject(AppData())
    }
}
