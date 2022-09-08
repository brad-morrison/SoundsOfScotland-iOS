//
//  TitleView.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        ZStack {
            
            VStack {
                Image("title")
                    .resizable()
                    .scaledToFit()
                    .colorInvert()
                    .opacity(0.7)
                    .padding(.horizontal, 80)
                    .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 12)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                    
                
                
                Spacer()
            }
        }
        .background(Color("Background Light"))
        .background(
           /* Image("6")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .ignoresSafeArea()
                .blur(radius: 50) */
        )
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
