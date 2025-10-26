//
//  SettingsView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    
    //State properties for each settings
    @State private var soundEnabled = true
    @State private var musicVolume: Double = 0.5
    @State private var graphicsQuality = "High"
    @State private var gameDifficulty = "Normal"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Toggle(isOn: $soundEnabled) {
                        Text("Sound Effects")
                    }
                    .padding()
                    
                    VStack {
                        Text("Music Volume: \(Int(musicVolume * 100))%")
                            .fontWeight(.medium)
                        Slider(value: $musicVolume, in: 0...1)
                            .padding([.leading, .trailing])
                    }
                    .padding()
                    
                    VStack {
                        Text("Graphics Quality")
                            .fontWeight(.medium)
                        Picker("Graphics Quality", selection: $graphicsQuality) {
                            Text("Low").tag("Low")
                            Text("Medium").tag("Medium")
                            Text("High").tag("High")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding(25)
                    
                    VStack {
                        Text("Game Difficulty")
                            .fontWeight(.medium)
                        Picker("Game Difficulty", selection: $gameDifficulty) {
                            Text("Easy").tag("Easy")
                            Text("Normal").tag("Normal")
                            Text("Hard").tag("Hard")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding(25)
                }
                .padding(20)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationTitle("Settings")
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

// Preview provider for the SettingsView
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(true))
    }
}

