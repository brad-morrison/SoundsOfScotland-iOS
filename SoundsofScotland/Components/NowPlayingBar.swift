//
//  NowPlayingBar().swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 19/05/2023.
//

import SwiftUI

struct NowPlayingBar: View {
    @EnvironmentObject var data : AppData
    
    @GestureState private var dragState = DragState.inactive
    @State private var offset = CGSize.zero
    
    enum DragState {
        case inactive
        case dragging(translation: CGSize)
    }
    
    var body: some View {
        
        HStack {
            
            PlayButton(size: 6, iconSize: 20)
            Text("Now Playing")
                .customFont(.footnote2)
            Spacer()
            Text(data.place.name ?? "")
        }
        
        .foregroundColor(.white)
        .frame(height: 300, alignment: .topLeading)
        .padding(.horizontal, 25)
        .padding(.vertical, 13)
        .background {
            Image(data.place.image ?? "")
                .resizable()
                .scaledToFill()
                .blur(radius: 3)
        }
        
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .offset(y: offset.height)
        .onTapGesture {
            data.selectedTab = .nowPlaying
        }
        
        .gesture(
            DragGesture()
                .updating($dragState) { value, state, _ in
                    state = .dragging(translation: value.translation)
                    //
                    offset.height = value.translation.height
                }
                .onEnded { value in
                    if value.translation.height > 0 {
                        // User dragged down
                        withAnimation {
                            print("Dragging down!")
                            data.nowPlayingBarOpen = false
                        }
                    } else {
                        if value.translation.height < 0 {
                            // User dragged up
                            withAnimation(.spring()) {
                                print("Dragging up!")
                                //data.nowPlayingBarOpen = false
                                offset = .zero
                            }
                        }
                    }
                }
        )
        
    }
}

struct NowPlayingBar_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingBar()
            .environmentObject(AppData())
    }
}
