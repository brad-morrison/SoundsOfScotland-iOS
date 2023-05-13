//
//  ContentView.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI
import RiveRuntime
import AVFoundation

@MainActor class AppData : ObservableObject {
    @Published var soundscape = soundscapes[1]
    @Published var tabOpen = true
    @Published var settingsButtonStatus = false
    @Published var nowPlayingOpen = false
    @Published var selectedTab: Tab = .home
    @Published var isPlaying = false
    @Published var nowPlayingBarOpen = false
}

@MainActor class AudioManager : ObservableObject {
    var audioPlayer : AVAudioPlayer?
    
    func loadAudio(filename: String) {
        guard let path = Bundle.main.path(forResource: filename, ofType: "wav") else {
            print("[shark]", filename + " is not found")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            print("playing")
        } catch {
            print("[shark], audioPlayer cannot load", path, error)
        }
    }
    
    func playAudio() {
        audioPlayer?.play()
    }
    
    func stopAudio() {
        audioPlayer?.stop()
    }
}

struct ContentView: View {
    //@AppStorage("selectedTab") var selectedTab: Tab = .home
    @StateObject var data = AppData()
    @StateObject var audioManager = AudioManager()
    //@State var isOpen = false
    //@State var tabOpen = true
    //@State var nowPlayingOpen = false
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        
        NavigationView {
            ZStack {
                    SideMenu()
                        .opacity(data.settingsButtonStatus ? 1 : 0)
                        .offset(x: data.settingsButtonStatus ? 0 : -300)
                        .rotation3DEffect(.degrees(data.settingsButtonStatus ? 0 : 30), axis: (x:0 , y: 1, z: 0))
                    
                    Group {
                        switch data.selectedTab {
                        case .home:
                            HomeView()
                                .rotation3DEffect(.degrees(data.settingsButtonStatus ? 30 : 0), axis: (x: 0, y: -1, z: 0))
                                .offset(x: data.settingsButtonStatus ? 265 : 0)
                                .scaleEffect(data.settingsButtonStatus ? 0.9 : 1)
                                .ignoresSafeArea()
                        case .categories:
                            Text("Categories")
                        case .starred:
                            Text("Starred")
                        case .nowPlaying:
                            //SceneView(tabOpen: $tabOpen, selectedTab: $selectedTab, nowPlayingOpen: $nowPlayingOpen)
                            SceneView(soundscape: soundscapes[0])
                        }
                    }
                    
                    button.view()
                        .frame(width: 44, height: 44)
                        .mask(Circle())
                        .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                        .offset(x: data.settingsButtonStatus ? 220 : 0)
                        .offset(x: data.nowPlayingOpen ? -80 : 0)
                        .onTapGesture {
                            button.setInput("data.settingsButtonStatus", value: data.settingsButtonStatus)
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                data.settingsButtonStatus.toggle()
                                data.tabOpen.toggle()
                            }
                        }
                    
                    //
                    NowPlayingBar()
                        .mask(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .offset(y: 448)
                        // handle on if playing audio
                        .onChange(of: data.isPlaying) { newValue in
                            if (data.selectedTab != .nowPlaying) {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    //data.tabOpen.toggle()
                                    data.nowPlayingBarOpen = true
                                }
                            }
                            else {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    data.nowPlayingBarOpen = false
                                }
                            }
                        }
                        // handle on tab change
                        .onChange(of: data.selectedTab) { newValue in
                            if (data.selectedTab == .nowPlaying) {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    //data.tabOpen.toggle()
                                    data.nowPlayingBarOpen = false
                                }
                            }
                            if (data.selectedTab != .nowPlaying) {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    //data.tabOpen.toggle()
                                    data.nowPlayingBarOpen = true
                                }
                            }
                        }
                        .offset(y: data.nowPlayingBarOpen ? 0 : 448) // offset if scene view open
                        .offset(y: data.settingsButtonStatus ? 220 : 0) // offset if sidebar open
                    //
                    
                    TabBar()
                        .onChange(of: data.selectedTab) { newValue in
                            if (data.selectedTab == .nowPlaying) {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    data.tabOpen.toggle()
                                    data.nowPlayingOpen.toggle()
                                }
                            }
                            else {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    data.nowPlayingOpen = false
                                }
                            }
                        }
                        .offset(y: data.tabOpen ? 0 : 120)
                        
                    
                    
                }
                .environmentObject(data)
                .environmentObject(audioManager)
            .background(Color("Background Light"))
        }
        }
        
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
