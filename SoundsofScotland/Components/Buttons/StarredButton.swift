//
//  StarredButton.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 18/05/2023.
//

import SwiftUI

struct StarredButton: View {
    var size: CGFloat
    var iconSize: CGFloat
    @EnvironmentObject var data : AppData
    var place: PlaceEntity
    @StateObject private var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    @State var starState = false
    
    var body: some View {
        StarredButtonState()
            .onAppear(perform: {
                viewModel.fetchPlaces()
                starState = place.starred
            })
            .onTapGesture {
                if (starState)
                {
                    viewModel.setStarred(state: false, place: place)
                    starState = false
                }
                else
                {
                    viewModel.setStarred(state: true, place: place)
                    starState = true
                }
            }
            
    }
    
    func StarredButtonState() -> some View {
        if (starState) {
            return RoundButton(type: "star.fill", size: size, iconSize: iconSize)}
        else {
            return RoundButton(type: "star", size: size, iconSize: iconSize)}
    }
}

struct StarredButton_Previews: PreviewProvider {
    static var previews: some View {
        StarredButton(size: 5, iconSize: 20, place: dummyPlace())
    }
}
