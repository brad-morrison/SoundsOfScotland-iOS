//
//  StarredButtonSmall.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 20/05/2023.
//

import SwiftUI

struct StarredButtonSmall: View {
    let size: CGFloat
    @State private var buttonState = true
    var place: PlaceEntity
    @StateObject var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        
        Button(action: {
            buttonState.toggle()
            viewModel.setStarred(state: false, place: place)
        }) {
            Image(systemName: "star.fill")
                .font(.system(size: size))
                .foregroundColor(buttonState ? .yellow : .black)
                .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 12)
        }
    }
}

struct StarredButtonSmall_Previews: PreviewProvider {
    static var previews: some View {
        StarredButtonSmall(size: 30, place: dummyPlace())
    }
}
