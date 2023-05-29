//
//  OnBoardingView.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 24/05/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import AuthenticationServices
import CryptoKit

struct OnBoardingView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel : AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var isRegistering = false
    
    
    
    var body: some View {
        
        VStack {
            
            // close button
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 18))
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(9)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
            }
             
            
            // login/Register UI
            Text(isRegistering ? "Register" : "Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Perform login or registration logic here
                if isRegistering {
                } else {
                }
            }) {
                Text(isRegistering ? "Register" : "Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Text("or")
            
            // Sign in with Apple //
            SignInWithAppleButton(isRegistering ? .signUp : .signIn) { request in
                authViewModel.handleSignInWithAppleRequest(request)
            } onCompletion: { result in
                authViewModel.handleSignInWithAppleCompletion(result)
            }
            .frame(height: 54)
            .cornerRadius(10)
            .padding()
            
            Spacer()
            
        }
        .padding()
    }
}


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
