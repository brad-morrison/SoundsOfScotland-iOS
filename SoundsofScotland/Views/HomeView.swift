//
//  HomeView.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var data : AppData
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    NewSection()
                    FeaturedSection()
                    RecentSection()
                    TrySection()
                    ExploreSection()
                    ComingSoonSection()
                }
                .padding(.top, 130)
            }
        }
        .ignoresSafeArea()
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .onAppear{
            data.mostRecentTab = .home
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppData())
    }
}
