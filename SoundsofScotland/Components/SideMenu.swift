//
//  SideMenu.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 18/05/2023.
//

import SwiftUI

struct SideMenu: View {
    //@EnvironmentObject var data : AppData
    @State private var isShowingOnboarding = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.8))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text("Bradley Morrison")
                        .customFont(.body)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding()
            
            Text("BROWSE")
                .customFont(.subheadline2)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            
            
            Text("HISTORY")
                .customFont(.subheadline2)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            Button {
                isShowingOnboarding.toggle()
            } label: {
                Text("login")
                    .customFont(.headline)
            }
            .padding()
            .padding(.horizontal, 100)
            .background(Color(.lightGray))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .padding(.top, 80)
            
            Spacer()
            
            
        }
        .foregroundColor(.black)
        .frame(maxWidth: 288, maxHeight: .infinity)
        //.background(Color("Background Light"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
        .sheet(isPresented: $isShowingOnboarding) {
            OnBoardingView()
        }
    }
}


struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
