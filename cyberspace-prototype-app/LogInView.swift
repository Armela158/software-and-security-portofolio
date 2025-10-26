//
//  LogInView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct LogInView: View {
    @Binding var isUserAuthenticated: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingPassword: Bool = false
    @State private var isShowingForgotPasswordAlert: Bool = false
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    @State private var isShowingConfirmation: Bool = false
    
    func login() {
        if email.lowercased() == "user@example.com" && password == "password" {
            isUserAuthenticated = true
        } else {
            showError = true
            errorMessage = "Incorrect email or password."
        }
    }
        
        func sendPasswordReset() {
            
            print("Send password reset link to \(email)")
            
            self.isShowingConfirmation = true
        }
    
    var body: some View {
        ZStack {
            //Background with visual effect
            VisualEffectView(effect: UIBlurEffect(style: .dark))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("Log In")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                
                //Email field
                TextField("Email", text: $email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                //Password field with toggle for showing password
                HStack {
                    if isShowingPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    Button(action: {
                        isShowingPassword.toggle()
                    }) {
                        Image(systemName: isShowingPassword ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal)
                
                //Login button
                Button(action: login) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                //Forgot password button
                Button("Forgot Password?") {
                    self.isShowingForgotPasswordAlert = true
                }
                .foregroundColor(.white)
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: showError)
                .alert(isPresented: $isShowingForgotPasswordAlert) {
                    Alert(
                        title: Text("Reset Password"),
                        message: Text("Enter your email to reset your password."),
                        primaryButton: .default(Text("Send")) {
                            sendPasswordReset()
                        },
                        secondaryButton: .cancel()
                    )
                }
                
                //Error message if login fails
                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

//MARK: - Visual Effect View Helper
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(isUserAuthenticated: .constant(false))
    }
}


