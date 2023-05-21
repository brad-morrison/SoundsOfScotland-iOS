//
//  NewSection.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 17/05/2023.
//

import SwiftUI

struct NewSection: View {
    
    @StateObject private var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        VStack(spacing: 0) {
            Text("New")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            // large featured cards
            LargeWideCard(place: viewModel.places[0])
                .padding(20)
        }
    }
}

struct NewSection_Previews: PreviewProvider {
    static var previews: some View {
        NewSection()
    }
}
