//
//  HelpAboutView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct HelpAboutView: View {
    @Binding var isPresented: Bool
    @State private var showingWebView = false
    @State private var request: URLRequest?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("About CyberScape")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("CyberScape is an augmented reality app designed to enhance your cybersecurity skills through interactive challenges and scenarios.")
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Features")
                            .font(.headline)
                        
                        Text("• Augmented reality scenarios")
                        Text("• Interactive learning modules")
                        Text("• Progress tracking and rewards")
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Version")
                            .font(.headline)
                        Text("1.0.0")
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Contact Us")
                            .font(.headline)
                        Text("For support or feedback, please email us: support@cyberscape.com")
                    }
                    
                    Divider()

                    Button("Terms of Service") {
                        if let url = Bundle.main.url(forResource: "TermsOfService", withExtension: "html") {
                            self.request = URLRequest(url: url)
                            self.showingWebView = true
                        } else {
                            print("Terms of Service HTML file not found.")
                        }
                    }
                    .padding()

                                        
                    Button("Privacy Policy") {
                        if let url = Bundle.main.url(forResource: "PrivacyPolicy", withExtension: "html") {
                            self.request = URLRequest(url: url)
                            self.showingWebView = true
                        } else {
                            print("Privacy Policy HTML file not found.")
                        }
                    }
                    .padding()

                                    }
                                    .padding()
                                    .navigationTitle("Help / About")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .navigationBarItems(leading: Button(action: {
                                        self.isPresented = false
                                    }) {
                                        Image(systemName: "house").imageScale(.large).padding(.leading, 16)
                                    })
                                    .background(
                                        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                                            .edgesIgnoringSafeArea(.all)
                                    )
                                }
            .sheet(isPresented: $showingWebView) {
                        if let request = request {
                            WebView(request: request)
                        } else {
                            Text("Unable to load the content.")
                        }
                                }
                            }
                        }
                    }

                    // Preview provider for the HelpAboutView
                    struct HelpAboutView_Previews: PreviewProvider {
                        static var previews: some View {
                            HelpAboutView(isPresented: .constant(true))
                        }
                    }


