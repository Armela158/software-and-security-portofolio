//
//  ProgressRewardsView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct ProgressRewardsView: View {
    @Binding var isPresented: Bool
    
    // Example state for progress and rewards
    @State private var experiencePoints: Int = 1200
    @State private var currentLevel: Int = 3
    @State private var nextRewardLevel: Int = 5
    @State private var rewards: [String] = ["Encryption Decoder", "Phishing Shield", "Malware Analyzer"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Your Progress")
                        .font(.title2)
                        .fontWeight(.bold)

                    // Experience Points
                    VStack {
                        Text("Experience Points")
                            .font(.headline)
                        ProgressView(value: Double(experiencePoints), total: 2000.0)
                            .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                    }

                    // Current Level
                    VStack {
                        Text("Current Level: \(currentLevel)")
                            .font(.headline)
                        HStack {
                            ForEach(0..<nextRewardLevel, id: \.self) { index in
                                Image(systemName: "star.fill")
                                    .foregroundColor(index < currentLevel ? .yellow : .gray)
                            }
                        }
                    }

                    // Rewards Earned
                    VStack(alignment: .leading) {
                        Text("Rewards Earned")
                            .font(.headline)
                        ForEach(rewards, id: \.self) { reward in
                            Text(reward)
                            Divider()
                        }
                    }
                }
                .padding()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationTitle("Progress & Rewards")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                self.isPresented = false
            }) {
                Image(systemName: "house")
                    .imageScale(.large)
                    .padding(.leading, 16)
            })
        }
    }
}

// Preview provider for the ProgressRewardsView
struct ProgressRewardsView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRewardsView(isPresented: .constant(true))
    }
}
