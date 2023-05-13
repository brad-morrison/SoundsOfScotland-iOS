//
//  PlayButton.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 13/05/2023.
//

import SwiftUI

struct PlayButton: View {
    var size: CGFloat
    var iconSize: CGFloat
    @EnvironmentObject var data : AppData
    var body: some View {
        PlayButtonState()
            .onTapGesture {
                data.isPlaying.toggle()
            }
        
    }
    
    func PlayButtonState() -> some View {
        if (data.isPlaying) {
            return RoundButton(type: "pause.fill", size: size, iconSize: iconSize)}
        else {
            return RoundButton(type: "play.fill", size: size, iconSize: iconSize)}
    }
}



struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(type: "play.fill", size: 5, iconSize: 20)
    }
}
