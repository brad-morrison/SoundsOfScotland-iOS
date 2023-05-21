//
//  RoundButton.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 18/05/2023.
//

import SwiftUI

struct RoundButton: View {
    var type: String
    var size: CGFloat
    var iconSize: CGFloat
    
    var body: some View {
        Image(systemName: type)
            .frame(width: size, height: size)
            .font(.system(size: iconSize))
            .padding(22)
            .foregroundColor(.white)
            .background(.black.opacity(0.5))
            .mask(Circle())
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(type: "play", size: 70, iconSize: 32)
    }
}
