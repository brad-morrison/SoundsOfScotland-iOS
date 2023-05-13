//
//  SceneView.swift
//  SoundsofScotland
//
//  Created by Brad on 06/09/2022.
//

import SwiftUI
import AVFoundation

struct SceneView: View {
    var soundscape: Soundscape
    var loadingNewScene = false
    @EnvironmentObject var data : AppData
    @EnvironmentObject var globalAudio : AudioManager
    
    var body: some View {
        ZStack {
            VStack {
                Text(data.soundscape.title)
                    .foregroundColor(.white)
                    .customFont(.largeTitle)
                
                Spacer()
                
                HStack {
                    RoundButton(type: "chevron.backward", size: 30, iconSize: 32)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                data.tabOpen.toggle()
                                data.nowPlayingOpen.toggle()
                                data.selectedTab = .home
                            }
                        }
                    PlayButton(size: 60, iconSize: 50)
                        .onAppear {
                            
                            // load in new data if new scene
                            if (data.soundscape.path != globalAudio.audioPlayer?.url?.deletingPathExtension().lastPathComponent)
                            {
                                print("new sound loaded")
                                let fileName = data.soundscape.path
                                globalAudio.loadAudio(filename: fileName)
                            }
                            else
                            {
                                print("same sound detected - not creating new sound")
                            }
                            
                            //
                            /*
                            if (data.isPlaying == false)
                            {
                                let fileName = data.soundscape.path
                                globalAudio.loadAudio(filename: fileName)
                                globalAudio.playAudio()
                                //
                                data.isPlaying = true
                            }
                             */
                        }
                        .onTapGesture {
                            data.isPlaying.toggle()
                        }
                    
                        .onDisappear {
                            //globalAudio.stopAudio()
                        }
                    RoundButton(type: "star.fill", size: 30, iconSize: 32)
                }
                    
            }
            .padding(.vertical, 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(data.soundscape.image.resizable().scaledToFill())
        .ignoresSafeArea()
        

        
    }
}

struct SceneView_Previews: PreviewProvider {
    static var previews: some View {
        SceneView(soundscape: soundscapes[1])
            .environmentObject(AppData())
            .environmentObject(AudioManager())
    }
}
