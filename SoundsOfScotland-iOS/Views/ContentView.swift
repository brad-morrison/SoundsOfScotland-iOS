//
//  ContentView.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var isOpen = false
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        ZStack {
            SideMenu()
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x:0 , y: 1, z: 0))
            
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                        .rotation3DEffect(.degrees(isOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0))
                        .offset(x: isOpen ? 265 : 0)
                        .scaleEffect(isOpen ? 0.9 : 1)
                        .ignoresSafeArea()
                case .categories:
                    Text("Categories")
                case .starred:
                    Text("Starred")
                case .nowPlaying:
                    SceneView()
                }
            }
            
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 220 : 0)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
                }
            
            TabBar()
                .offset(y: isOpen ? 120 : 0)
            
            
        }
        .background(Color("Background Light"))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
