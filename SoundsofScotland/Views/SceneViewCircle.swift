//
//  SceneView.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 18/05/2023.
//

import SwiftUI

struct SceneViewCircle: View {
    
    var place: PlaceEntity
    var loadingNewScene = false
    @EnvironmentObject var data : AppData
    @EnvironmentObject var globalAudio : AudioManager
    
    var body: some View {
        ZStack {
            VStack {
                Text(data.place.name ?? "")
                    .foregroundColor(.black)
                    .customFont(.largeTitle)
                
                Spacer()
                
                ZStack {
                    Image(place.image ?? "0")
                        .resizable()
                        .frame(width: 378, height: 378)
                        .scaledToFill()
                        .clipShape(Circle())
                        .blur(radius: 40)
                    
                    Image(place.image ?? "0")
                        .resizable()
                        .frame(width: 378, height: 378)
                        .scaledToFill()
                        .clipShape(Circle())
                    
                }
                
                Spacer()
                
                HStack {
                    RoundButton(type: "chevron.backward", size: 30, iconSize: 32)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                data.tabOpen.toggle()
                                data.nowPlayingBarOpen.toggle()
                                data.selectedTab = .home
                            }
                        }
                    PlayButton(size: 60, iconSize: 50)
                        .onAppear {
                            
                            // load in new data if new scene
                            
                            
                            if (data.place.path != globalAudio.audioPlayer?.url?.deletingPathExtension().lastPathComponent)
                            {
                                print("new sound loaded")
                                let fileName = data.place.path
                                print("LOADED \(data.place.path) into fileName")
                                globalAudio.loadAudio(filename: fileName!)
                            }
                            else
                            {
                                print("same sound detected - not creating new sound")
                            }
                            
                            
                            
                            //
                            
                            if (data.isPlaying == false)
                            {
                                let fileName = data.place.path
                                globalAudio.loadAudio(filename: fileName!)
                                globalAudio.playAudio()
                                //
                                data.isPlaying = true
                            }
                            
                        }
                        .onTapGesture {
                            data.isPlaying.toggle()
                        }
                    
                        .onDisappear {
                            //globalAudio.stopAudio()
                        }
                    StarredButton(size: 30, iconSize: 32, place: data.place)
                }
                
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}



struct SceneViewCircle_Previews: PreviewProvider {
    static var previews: some View {
        SceneViewCircle(place: dummyPlace())
            .environmentObject(AppData())
            .environmentObject(AudioManager())
    }
}
