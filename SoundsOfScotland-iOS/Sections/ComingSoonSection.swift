//
//  ComingSoonSection.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import SwiftUI

struct ComingSoonSection: View {
    
    @StateObject private var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Coming Soon")
                .multilineTextAlignment(.center)
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 20)
            
            // large featured cards
            LargeWideCard(comingSoon: true, place: viewModel.places[0])
                .padding(20)
        }
        .padding(.bottom, 110)
    }
}

struct ComingSoonSection_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonSection()
    }
}
