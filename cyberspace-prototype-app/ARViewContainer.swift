//
//  ARViewContainer.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 21/04/2024.
//

// ARViewContainer.swift

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    var gameCoordinator: GameCoordinator
    @Binding var showQuiz: Bool
    
    func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero)
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = .horizontal // Detect horizontal surfaces
            arView.session.run(config)
            
            let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.didTap(_:)))
            arView.addGestureRecognizer(tapGesture)
            
            return arView
        }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, gameCoordinator: gameCoordinator, showQuiz: $showQuiz)
    }
    
    class Coordinator: NSObject {
        var parent: ARViewContainer
        var gameCoordinator: GameCoordinator
        var showQuiz: Binding<Bool>
        
        init(_ parent: ARViewContainer, gameCoordinator: GameCoordinator, showQuiz: Binding<Bool>) {
            self.parent = parent
            self.gameCoordinator = gameCoordinator
            self.showQuiz = showQuiz
        }
        
        @objc func didTap(_ sender: UITapGestureRecognizer) {
                    guard let arView = sender.view as? ARView else { return }
                    let location = sender.location(in: arView)
                    let results = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)
                    
                    if let firstResult = results.first {
                        gameCoordinator.placeThreatEntity(at: firstResult.worldTransform, in: arView)
                    }
                }
            }
        }
