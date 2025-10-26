//
//  ARInteractionsView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct ARInteractionsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                //Title
                Text("AR Interactions")
                    .font(.system(size: 36, weight: .bold, design: .rounded)) //A larger, rounded font for the title
                    .foregroundColor(Color(red: 0.95, green: 0.75, blue: 0.5))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2) //Text shadow for depth
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                
                //Content
                VStack(alignment: .leading, spacing: 10) {
                    InformationText(title: "AR Activation:", detail: "Point your device at a flat surface to activate the AR environment.")
                    Spacer()
                    InformationText(title: "Interactive Elements:", detail: "Interact with virtual elements that appear in your real-world environment.")
                    Spacer()
                    InformationText(title: "Real-Time Response:", detail: "Use your device to scan, identify and neutralize virtual cyber threats that appear in your surroundings.")
                    Spacer()
                    InformationText(title: "Engagement:", detail: "Physically move around to explore different aspects of each cyber threat scenario.")
            }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5)) //Card-like design for the content
                .padding(.horizontal)
        }
    }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationBarTitleDisplayMode(.inline)
}
    
    var backButton: some View {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left") // Chevron for a more universally recognizable back button
                        .imageScale(.large)
                    Text("Back")
                }
                .foregroundColor(.blue)
            }
        }
    }

    struct InformationText: View {
        let title: String
        let detail: String

        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(detail)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, 5) // Indent the detail text for better visual grouping
            }
        }
    }

    // Preview provider for SwiftUI previews in the development environment
    struct ARInteractionsView_Previews: PreviewProvider {
        static var previews: some View {
            ARInteractionsView()
        }
    }
