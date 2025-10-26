//
//  GameplayInstructionsView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct GameplayInstructionsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                // Title
                Text("Instructions on Gameplay")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity) // Ensures the title is centered by taking the full width

                // Content
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    Text("Use touchscreen controls to navigate through the game environment.")
                        .foregroundColor(.gray)
                        .padding()
                                        
                    Text("Challenge Acceptance")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                    Text("Select cyber threat scenarios to engage with.")
                        .foregroundColor(.gray)
                        .padding()
                                        
                    Text("Decision Making")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                    Text("Choose from multiple response options in each scenario to resolve cyber threats.")
                        .foregroundColor(.gray)
                        .padding()
                                        
                    Text("Scoring and Progressing")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                    Text("Earn points for successful threat resolutions. Progress to more complex challenges as your score increases.")
                        .foregroundColor(.gray)
                        .padding()

                    
                }
                .padding()
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Spacer() // This Spacer is used to center the title view
                    Text("Instructions on Gameplay")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer() // This Spacer is used to center the title view
                }
            }

            }
        }
    }


// Preview provider for SwiftUI previews in the development environment
struct GameplayInstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        GameplayInstructionsView()
    }
}
