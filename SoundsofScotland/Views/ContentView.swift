//
//  ContentView.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 16/05/2023.
//

import SwiftUI
import RiveRuntime
import AVFoundation
import CoreData

class AppData : ObservableObject {
    @Published var place: PlaceEntity = dummyPlace()
    @Published var tabOpen = true
    @Published var selectedTab: Tab = .home
    @Published var settingsButtonStatus = false
    @Published var nowPlayingBarOpen = false
    @Published var isPlaying = false
    @Published var shadows = true // controls all card shadows
    @Published var mostRecentTab: Tab = .home
    //
}

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject var data = AppData()
    @StateObject var globalAudio = AudioManager()
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
                        CoreDataListView()
                        
                    case .starred:
                        StarredTempView()
                        
                        
                    case .nowPlaying:
                        //SceneView(tabOpen: $tabOpen, selectedTab: $selectedTab, nowPlayingOpen: $nowPlayingOpen)
                        SceneView(place: data.place, loadingNewScene: true)
                        //Text("SceneView")
                    }
                }
                
                if (data.selectedTab == .home) {
                    button.view()
                        .frame(width: 44, height: 44)
                        .mask(Circle())
                        .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                        .offset(x: data.settingsButtonStatus ? 220 : 0)
                    //.offset(x: data.nowPlayingBarOpen ? -80 : 0)
                        .onTapGesture {
                            button.setInput("data.settingsButtonStatus", value: data.settingsButtonStatus)
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                data.settingsButtonStatus.toggle()
                                data.tabOpen.toggle()
                            }
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
                                data.nowPlayingBarOpen.toggle()
                            }
                        }
                        else {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                data.nowPlayingBarOpen = false
                            }
                        }
                    }
                    .offset(y: data.tabOpen ? 0 : 120)
                
                
            }
            .environmentObject(data)
            .environmentObject(globalAudio)
            .environmentObject(authViewModel)
            
        }
        .background(Color("Background Light"))
        .onAppear {
            //viewModel.populateDataIfNeeded()
            //viewModel.dataTestPopulate()
            viewModel.resetData()
        }
        
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

