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
            VStack {
                Text("NOW PLAYING")
                    .foregroundColor(.white)
                    .customFont(.largeTitle)
                
                Spacer()
                
                HStack {
                    RoundButton(type: "chevron.backward", size: 30)
                    RoundButton(type: "play.fill", size: 50)
                    RoundButton(type: "star.fill", size: 30)
                }
                    
            }
            .padding(.vertical, 100)
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
