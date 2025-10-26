//
//  WelcomeView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isUserAuthenticated: Bool
    @Binding var shouldShowWelcome: Bool
    @State private var isActive: Bool = false
    @State private var textAnimation: Double = 1.0
    
    let delayInSeconds = 2.0 //Delay time in seconds
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]),
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    Text("Welcome to CyberScape")
                        .font(Font.custom("AvenirNext-Bold", size: 30))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .scaleEffect(textAnimation)
                        .onAppear {
                            // Animate the text to increase and decrease in size repeatedly
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                textAnimation = 1.1
                            }
                        }
                        .padding()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) {
                self.isActive = true
                self.shouldShowWelcome = false
            }
        }
        NavigationLink(destination: AgeVerificationView(isUserAuthenticated: .constant(false), showLoginSignupDecision: .constant(false)), isActive: $isActive) {
            EmptyView()
        }
        .navigationBarHidden(true)
    }
}
    
    
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView(isUserAuthenticated: .constant(false), shouldShowWelcome: .constant(true))
        }
    }

