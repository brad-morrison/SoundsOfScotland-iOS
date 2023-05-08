//
//  HomeView.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI

struct HomeView: View {
    @State var sceneIsOpen = false
    
    var body: some View {
        ZStack {
            
            
            ScrollView {
                content
                    .padding(.top, 60)
            }
            
        }
        .ignoresSafeArea()
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        
    }
        
}

let columns = [
    GridItem(.flexible(), spacing: 20),
    GridItem(.flexible(), spacing: 20)
]

var content: some View {
    VStack(alignment: .leading, spacing: 0) {
        
        title
        new_Section
        featured_Section
        recent_Section
        TrySomethingNew_Section
        explore_Section
        comingSoon_Section
        
    }
    //.foregroundColor(.white)
    
}

var title: some View {
    VStack {
        Image("title")
            .resizable()
            .scaledToFit()
            .colorInvert()
            .opacity(0.7)
            .padding(.horizontal, 80)
            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 12)
            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
        
        Spacer()
    }
    .padding(20)
}

var new_Section: some View {
    // title
    VStack(spacing: 0) {
        Text("New")
            .customFont(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
        
        // large featured cards
        LargeWideCard(soundscape: soundscapes[6])
            .padding(20)
    }
}

var featured_Section: some View {
    // title
    VStack(spacing: 0) {
        // title
        Text("Featured")
            .customFont(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
        
        // large featured cards
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(soundscapes) { soundscape in
                    LargeCard(soundscape: soundscape)
                }
            }
            .padding(20)
            .padding(.bottom, 10)
        }
    }
}

var recent_Section: some View {
    // title
    VStack(spacing: 0) {
        // title
        Text("Recent")
            .customFont(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        
        // vertical medium cards
        VStack(spacing: 20) {
            MediumCard(soundscape: soundscapes[2])
            MediumCard(soundscape: soundscapes[6])
            MediumCard(soundscape: soundscapes[4])
        }
        .padding(20)
    }
}

var TrySomethingNew_Section: some View {
    // title
    VStack(spacing: 0) {
        // title
        Text("Try something new")
            .customFont(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        
        // round cards
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(soundscapes) { soundscape in
                    RoundCard(soundscape: soundscape)
                }
            }
            .padding(20)
            .padding(.bottom, 30)
        }
    }
}

var explore_Section: some View {
    // title
    VStack(spacing: 0) {
        // title
        Text("Explore")
            .customFont(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        
        // square cards
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(soundscapes) { soundscape in
                SquareCard(soundscape: soundscape)
            }
        }
        .padding(20)
    }
}

var comingSoon_Section: some View {
    // title
    VStack(spacing: 0) {
        // title
        Text("Coming Soon")
            .multilineTextAlignment(.center)
            .customFont(.title3)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 20)
        
        // large featured cards
        LargeWideCard(comingSoon: true, soundscape: soundscapes[7])
        .padding(20)
    }
    .padding(.bottom, 110)
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .background(Color("Background Light"))
            .previewInterfaceOrientation(.portrait)
    }
}
