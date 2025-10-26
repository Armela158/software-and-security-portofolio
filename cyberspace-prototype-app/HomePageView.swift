//
//  HomePageView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct HomePageView: View {
    @Binding var isUserAuthenticated: Bool
    @Binding var showARView: Bool
    @State private var showTutorial = false
    @State private var showSettings = false
    @State private var showHelpAbout = false
    @State private var showProgressRewards = false
    @State private var showCyberSafetyView = false
    
    
    var body: some View {
        ZStack {
            //Background with a radial gradient
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.blue.opacity(0.5)]), center: .center, startRadius: 100, endRadius: 500)
                .ignoresSafeArea()
            
            VStack {
                Spacer(minLength: 0)
                
                //Logo image
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .offset(y: -50)
                    .padding(.top, 20)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                //Text decription with custom fon and shadow
                Text("Embark on a riveting journey with AR-CyberScape, where augmented reality enhances your cybersecurity process. Tackle simulated cyber threats, learn through engaging AR scenarios, and built your defense skills. Ready for the challange? Enter the realm of AR-CyberScape and become a cyber guardian!")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    )
                    .cornerRadius(15)
                    .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.7), Color.white.opacity(0.1)]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                    )
                
                    .padding(.horizontal)
                    .scaleEffect(1.05)
                    .animation(
                        Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true),
                        value: UUID()
                    )
                
                Spacer(minLength: 5)
                
                //Start button
                Button(action: {
                    showARView = true
                }) {
                    Text("Start")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        .cornerRadius(10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding()
                }
                
                //Logout Button
                Button("Log Out") {
                    isUserAuthenticated = false
                }
                .foregroundColor(Color.white)
                .padding(5)
                .background(Capsule().fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)))
                
                
                //CyberSafetyView button
                Button("Learn Cyber Safety") {
                    showCyberSafetyView = true
                }
                .buttonStyle(CyberButtonStyle())
                
                //Bottom icons
                HStack(spacing: 65) {
                    //Tutorial Icon
                    Button(action: { showTutorial = true}) {
                        Image(systemName: "gamecontroller.fill")
                    }
                    .sheet(isPresented: $showTutorial) {
                        TutorialView(isPresented: $showTutorial)
                    }
                    
                    //Settings Icon
                    Button(action: { showSettings = true }) {
                        Image(systemName: "gearshape.fill")
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView(isPresented: $showSettings)
                    }
                    
                    //Help/About Icon
                    
                    Button(action: { showHelpAbout = true }) {
                        Image(systemName: "info.circle.fill")
                    }
                    .sheet(isPresented: $showHelpAbout) {
                        HelpAboutView(isPresented: $showHelpAbout)
                    }
                    
                    //Progress/Reward Icon
                    
                    Button(action: { showProgressRewards = true }) {
                        Image(systemName: "star.fill")
                    }
                    .sheet(isPresented: $showProgressRewards) {
                        ProgressRewardsView(isPresented: $showProgressRewards)
                    }
                    
                }
                
                
                
                // Navigation Link hidden in ZStack to navigate to CyberSafetyView
                NavigationLink(destination: CyberSafetyView(), isActive: $showCyberSafetyView) {
                    EmptyView()
                }
                .hidden()
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .padding(.bottom)
            
        }
    }
    
    
    
    struct CyberButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
    }
    
    struct HomePageView_Previews: PreviewProvider {
        static var previews: some View {
            HomePageView(isUserAuthenticated: .constant(true), showARView: .constant(false))
        }
    }
    
}
