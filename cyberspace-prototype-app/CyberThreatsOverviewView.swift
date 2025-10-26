//
//  CyberThreatsOverviewView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct CyberThreatsOverviewView: View {
    //Using the environment presentation mode to dismiss the view when needed
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                Text("Overview of Cyber Threats")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, 20)
                
                //Threat descriptions
                ForEach(cyberThreats, id: \.self) { threat in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(threat.title)
                            .font(.title2) //Larger font for the title
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.primary) //Darker color for better visibility
                        
                        Text(threat.description)
                            .foregroundColor(.secondary) //Lighter color for description
                            .padding(.bottom, 10) //Spacing after each description
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .navigationTitle("Overview of Cyber Threats")
        .navigationBarTitleDisplayMode(.inline)
    }
    var cyberThreats: [CyberThreat] {
            [
                CyberThreat(title: "Phishing Attacks", description: "Identify deceptive emails that try to steal sensitive data."),
                
                CyberThreat(title: "Malware", description: "Defend against harmful software designed to damage or disrupt systems."),
                
                CyberThreat(title: "Ransomware", description: "Learn strategies to prevent your data from being held hostage."),
                
                CyberThreat(title: "Man-in-the-Middle Attacks", description: "Spot eavesdropping on network communications."),
                
                CyberThreat(title: "SQL Injection", description: "Prevent attackers from exploiting vulnerabilities in database-driven applications."),
                
                CyberThreat(title: "Zero-Day Exploits", description: "React to new and unknown threats that exploit software vulnerabilities."),
                
                CyberThreat(title: "Denial-of-Service Attacks", description: "Maintain service availability in the face of traffic floods."),
                
                CyberThreat(title: "Advanced Persistent Threats", description: "Protect against prolonged and targeted cyber-espionage."),
                
                CyberThreat(title: "Cross-Site Scripting", description: "Shield your web applications from injection of malicious scripts."),
                
                CyberThreat(title: "Password Attacks", description: "Enforce strong authentication to resist brute force and guessing."),
                
                CyberThreat(title: "Insider Threats", description: "Safeguard against threats that come from within your own organization."),
                
                CyberThreat(title: "Social Engineering", description: "Train to recognize manipulation techniques used to gain trust."),
                
                CyberThreat(title: "IoT Vulnerabilities", description: "Secure your network of connected devices from various exploits."),
                
                CyberThreat(title: "Data Breaches", description: "Protect sensitive information from unauthorized access and exposures."),
                
                CyberThreat(title: "Mobile Security Threats", description: "Learn to secure smartphones against a range of mobile-specific attacks.")
            ]
        }
    }

struct CyberThreatQuiz {
    let threat: CyberThreat
    let question: String
    let options: [String]
    let correctAnswer: String
}


    // Preview provider for SwiftUI previews in the development environment
    struct CyberThreatsOverviewView_Previews: PreviewProvider {
        static var previews: some View {
            CyberThreatsOverviewView()
        }
    }

