//
//  RecentSection.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import SwiftUI

struct RecentSection: View {
    
    @StateObject private var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Recent")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            // vertical medium cards
            
            VStack(spacing: 20) {
                ForEach(0..<3) { index in
                    if index < viewModel.places.count {
                        MediumCard(place: viewModel.places[index])
                    }
                }
            }
            .padding(20)
        }
    }
}

struct RecentSection_Previews: PreviewProvider {
    static var previews: some View {
        RecentSection()
    }
}
