//
//  TabBar.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 18/05/2023.
//
import SwiftUI
import RiveRuntime

struct TabBarOptimised: View {
    @EnvironmentObject var data : AppData
    //let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                content
                    .padding(.top, 28)
            }
            .frame(height: 300, alignment: .topLeading)
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: 40, style: .continuous))
            .offset(y: 235)
        }
    }
    
    var content: some View {
         ForEach(tabItems) { item in
            Button {
                item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    item.icon.setInput("active", value: false)
                }
                withAnimation(.spring(response: 0.22, dampingFraction: 0.4)) {
                    data.selectedTab = item.tab
                }
            } label: {
                item.icon.view()
                    .frame(height: 36)
                    .opacity(data.selectedTab == item.tab ? 1 : 0.5)
                    .background(
                        VStack {
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: data.selectedTab == item.tab ? 60 : 0, height: 60)
                                .opacity(data.selectedTab == item.tab ? 1 : 0)
                                .foregroundColor(.black.opacity(0.25))
                        }
                    )
        }
        }
    }
}


struct TabBarOptimised_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}


struct TabItemOpt: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
    var tab: Tab
}

var tabItemsOpt = [
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), tab: .home),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .categories),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), tab: .starred),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "AUDIO_Interactivity", artboardName: "AUDIO"), tab: .nowPlaying),
    
]

enum TabOpt: String {
    case home
    case categories
    case starred
    case nowPlaying
}
