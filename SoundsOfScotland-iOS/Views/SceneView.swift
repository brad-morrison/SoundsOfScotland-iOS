//
//  SceneView.swift
//  SoundsofScotland
//
//  Created by Brad on 06/09/2022.
//

import SwiftUI

struct SceneView: View {
    //@Binding var tabOpen: Bool
    //@Binding var selectedTab: Tab
    //@Binding var nowPlayingOpen: Bool
    var soundscape: Soundscape
    @EnvironmentObject var data : AppData
    var body: some View {
        ZStack {
            VStack {
                Text(data.soundscape.title)
                    .foregroundColor(.white)
                    .customFont(.largeTitle)
                
                Spacer()
                
                HStack {
                    RoundButton(type: "chevron.backward", size: 30)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                //tabOpen.toggle()
                                //selectedTab = .home
                            }
                        }
                    RoundButton(type: "play.fill", size: 50)
                    RoundButton(type: "star.fill", size: 30)
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
    @State static var tabOpen = false
    @State static var nowPlayingOpen = false
    @State static var selectedTab: Tab = .home
    static var previews: some View {
        //SceneView(tabOpen: $tabOpen, selectedTab: $selectedTab, nowPlayingOpen: $nowPlayingOpen, soundscape: soundscapes[0])
        SceneView(soundscape: soundscapes[1])
            .environmentObject(AppData())
    }
}
