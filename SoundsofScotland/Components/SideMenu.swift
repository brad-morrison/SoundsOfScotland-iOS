//
//  SideMenu.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 18/05/2023.
//

import SwiftUI

struct SideMenu: View {
    @EnvironmentObject var data : AppData
    @EnvironmentObject var authData : AuthViewModel
    
    
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
            
            if (authData.isUserSignedIn() == false) {
                OnboardingSection()
            } else {
                Button(action: {
                    authData.signOut()
                }) {
                    Text("Sign Out")
                        .foregroundColor(.blue)
                        .padding(.top)
                }
            }
            
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
            
            
            
            Spacer()
            
            
        }
        .foregroundColor(.black)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color("Background Light"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}


struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
            .environmentObject(AppData())
            .environmentObject(AuthViewModel())

    }
}
