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
            
            
            // Sign in with Apple //
            SignInWithAppleButton(isRegistering ? .signUp : .signIn) { request in
                authViewModel.handleSignInWithAppleRequest(request)
            } onCompletion: { result in
                authViewModel.handleSignInWithAppleCompletion(result)
            }
            .frame(height: 54)
            .cornerRadius(10)
            .padding()
            
            Button(action: {
                isRegistering.toggle()
            }) {
                Text(isRegistering ? "Already have an account? Login" : "Don't have an account? Register")
                    .foregroundColor(.blue)
                    .padding(.top)
            }
            
            if Auth.auth().currentUser != nil {
                Text("user is signed in")
            } else {
                Text("user is NOT signed in")
            }
            
            Button(action: {
                getUser()
            }) {
                Text("Get User")
                    .foregroundColor(.blue)
                    .padding(.top)
            }
            
            Button(action: {
                authViewModel.signOut()
            }) {
                Text("Sign Out")
                    .foregroundColor(.blue)
                    .padding(.top)
            }
            
        }
        .padding()
    }
    
    func getUser() {
        let user = Auth.auth().currentUser
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
          let uid = user.uid
          let email = user.email
          let photoURL = user.photoURL
          var multiFactorString = "MultiFactor: "
          for info in user.multiFactor.enrolledFactors {
            multiFactorString += info.displayName ?? "[DispayName]"
            multiFactorString += " "
          }
            print("username: \(user.displayName)")
            print("username: \(user.uid)")
            print("\(Auth.auth().currentUser)")
            print("\(Auth.auth().currentUser?.displayName)")
            print(user.displayName)
            print(user.email)
            print(user.uid)
        }
    }
}


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
