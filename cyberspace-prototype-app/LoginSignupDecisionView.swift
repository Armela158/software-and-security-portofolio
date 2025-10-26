//
//  LoginSignupDecisionView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct LoginSignupDecisionView: View {
    @Binding var isUserAuthenticated: Bool
    @Binding var showLoginSignupDecision: Bool
    @State private var showLogin = false
    @State private var showSignup = false

    let buttonGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to CyberScape")
                .font(.largeTitle)
                .fontWeight(.bold)
                .transition(.slide)
                .animation(.easeInOut, value: showLoginSignupDecision)
            
            NavigationLink(destination: LogInView(isUserAuthenticated: $isUserAuthenticated), isActive: $showLogin) {
                HStack {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.white)
                    Text("Returning Player - Sign In")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                }
                .padding()
                .background(buttonGradient)
                .cornerRadius(20)
                .shadow(radius: 10)
            }

            NavigationLink(destination: SignUpView(isUserAuthenticated: $isUserAuthenticated), isActive: $showSignup) {
                HStack {
                    Image(systemName: "person.badge.plus.fill")
                        .foregroundColor(.white)
                    Text("New Player - Create Account")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                }
                .padding()
                .background(buttonGradient)
                .cornerRadius(20)
                .shadow(radius: 10)
            }
        }
        .padding()
        .navigationBarTitle("Sign In / Sign Up", displayMode: .inline)
        .onAppear {
            self.showLoginSignupDecision = false
            // Play an animation when the view appears
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                self.showLoginSignupDecision = true
            }
        }
    }
}

struct LoginSignupDecisionView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupDecisionView(isUserAuthenticated: .constant(false), showLoginSignupDecision: .constant(true))
    }
}

