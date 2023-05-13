//
//  FavButton.swift
//  SoundsOfScotland-iOS
//
//  Created by Bradley Morrison on 13/05/2023.
//

import SwiftUI

struct FavButton: View {
    var size: CGFloat
    var iconSize: CGFloat
    @EnvironmentObject var data : AppData
    
    var body: some View {
        FavButtonState()
            .onTapGesture {
                /*if (data.soundscape.fav)
                {
                    // set as not fav
                }
                else
                {
                    // set as fav
                }*/
            }
        
    }
    
    func FavButtonState() -> some View {
        /*if (data.soundscape.fav) {
            return RoundButton(type: "star.fill", size: size, iconSize: iconSize)}
        else {
            return RoundButton(type: "star", size: size, iconSize: iconSize)}*/
        RoundButton(type: "star.fill", size: size, iconSize: iconSize)}
    }


struct FavButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(type: "star", size: 5, iconSize: 20)
    }
}
