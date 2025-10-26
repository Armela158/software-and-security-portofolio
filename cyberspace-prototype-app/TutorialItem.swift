//
//  TutorialItem.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

// Define a model for the tutorial items
struct TutorialItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let color: Color
    let destinationView: AnyView
}

// Extend the tutorial items to conform to Identifiable for use in a List
let tutorialItems = [
    TutorialItem(title: "Instruction on Gameplay", icon: "gamecontroller.fill", color: .blue, destinationView: AnyView(GameplayInstructionsView())),
    TutorialItem(title: "AR Interactions", icon: "arkit", color: .green, destinationView: AnyView(ARInteractionsView())),
    TutorialItem(title: "Overview of Cyber Threats", icon: "shield.lefthalf.fill", color: .red, destinationView: AnyView(CyberThreatsOverviewView()))
]

// Create a view for the tutorial list
struct TutorialView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) { // Increase the spacing to fill the page more
                    ForEach(tutorialItems) { item in
                        NavigationLink(destination: item.destinationView) {
                            TutorialCard(item: item)
                        }
                    }
                }
                .padding()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            )
            .toolbar {
                // Customized toolbar content for larger and centered title
                ToolbarItem(placement: .principal) {
                    Text("Tutorial")
                        .font(.largeTitle) // Makes the text larger
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    homeButton
                }
            }
            .navigationBarHidden(false) // Ensure the navigation bar is not hidden
        }
    }

    var homeButton: some View {
        Button(action: {
            self.isPresented = false
        }) {
            Image(systemName: "house")
                .imageScale(.large)
                .padding(.leading, 16)
        }
    }
}

struct TutorialCard: View {
    let item: TutorialItem

    var body: some View {
            HStack {
                Image(systemName: item.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(item.color).shadow(radius: 3))
                    .foregroundColor(.white)
                    .padding(20) // Ensuring the icon has padding so it doesn't touch the edges

                // Ensure Text has a contrasting color and is not getting cut off
                Text(item.title)
                    .fontWeight(.medium)
                    .foregroundColor(.black) // Explicitly setting a contrasting color
                    .padding(.leading, 10)
                    .lineLimit(1) // Ensures text is only one line and does not wrap

                Spacer() // Ensures text and icon are pushed to opposite sides
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity) // Ensure the card stretches across the width
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5))
            .padding(.horizontal) // Padding on the sides of the card
        }
    }

// Preview provider for the TutorialView
struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(isPresented: .constant(true))
    }
}

