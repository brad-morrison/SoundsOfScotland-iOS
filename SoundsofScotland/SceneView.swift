//
//  SceneView.swift
//  SoundsofScotland
//
//  Created by Brad on 06/09/2022.
//

import SwiftUI

struct SceneView: View {
    var body: some View {
        ZStack {
            Text("NOW PLAYING")
                .foregroundColor(.white)
                .customFont(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("0").resizable().scaledToFill())
        .ignoresSafeArea()
        
    }
}

struct SceneView_Previews: PreviewProvider {
    static var previews: some View {
        SceneView()
    }
}
