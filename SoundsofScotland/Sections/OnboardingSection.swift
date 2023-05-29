//
//  OnboardingSection.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 29/05/2023.
//

import SwiftUI

struct OnboardingSection: View {
    
    @State private var isShowingOnboarding = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button {
                isShowingOnboarding.toggle()
            } label: {
                Text("Sign Up")
                    .customFont(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            HStack {
                Text("Already got an account?")
                
                Button {
                    isShowingOnboarding.toggle()
                } label: {
                    Text("Sign In")
                        .customFont(.body)
                }
            }
            
        }
        .padding()
        .sheet(isPresented: $isShowingOnboarding) {
            //OnBoardingView()
            FirebaseUITest()
        }
    }
}

struct OnboardingSection_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSection()
    }
}
