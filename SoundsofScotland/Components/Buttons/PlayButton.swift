//
//  PlayButton.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 18/05/2023.
//

import SwiftUI

struct PlayButton: View {
    var size: CGFloat
    var iconSize: CGFloat
    @EnvironmentObject var data : AppData
    @EnvironmentObject var globalAudio : AudioManager
    
    var body: some View {
        PlayButtonState()
            .onTapGesture {
                if (data.isPlaying)
                {
                    data.isPlaying = false
                    globalAudio.stopAudio()
                }
                else
                {
                    data.isPlaying = true
                    globalAudio.playAudio()
                }
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
        PlayButton(size: 5, iconSize: 20)
            .environmentObject(AppData())
    }
}
