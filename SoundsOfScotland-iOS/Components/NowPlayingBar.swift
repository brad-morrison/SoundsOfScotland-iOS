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
            RoundButton(type: "pause.fill", size: 5)
            Text("Now Playing")
                .customFont(.footnote2)
            Spacer()
            Text(data.soundscape.title)
        }
        .foregroundColor(.white)
        .frame(height: 300, alignment: .topLeading)
        .padding(.horizontal, 25)
        .padding(.vertical, 13)
        .background {
            data.soundscape.image
                .resizable()
                .scaledToFill()
                .blur(radius: 3)
        }
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct NowPlayingBar_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingBar()
            .environmentObject(AppData())
    }
}
