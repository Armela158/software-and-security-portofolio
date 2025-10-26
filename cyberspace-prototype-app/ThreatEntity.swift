//
//  ThreatEntity.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 21/04/2024.
//

// ThreatEntity.swift

// ThreatEntity.swift

import Foundation
import RealityKit

enum ThreatType {
    case normal, strong, powerUp
}

class ThreatEntity: Entity, HasModel, HasCollision, HasAnchoring {
    var type: ThreatType = .normal // Default type is normal
    var hitPoints: Int = 1 // Default hit points
    
    required init() {
        super.init()
        self.components[ModelComponent.self] = ModelComponent(
            mesh: .generateSphere(radius: 0.1),
            materials: [SimpleMaterial(color: .red, isMetallic: true)]
        )
        self.generateCollisionShapes(recursive: true)
        setupType()
    }
    
    private func setupType() {
        // Randomly assign type with an equal chance for each type
        let randomType = Int.random(in: 0...2)
        switch randomType {
        case 0:
            self.type = .normal
            // Appearance for normal threat
            let mesh = MeshResource.generateSphere(radius: 0.05)
            let material = SimpleMaterial(color: .red, isMetallic: true)
            self.components[ModelComponent.self] = ModelComponent(mesh: mesh, materials: [material])
        case 1:
            self.type = .strong
            // Appearance for strong threat
            let mesh = MeshResource.generateBox(size: [0.1, 0.1, 0.1])
            let material = SimpleMaterial(color: .green, isMetallic: true)
            self.components[ModelComponent.self] = ModelComponent(mesh: mesh, materials: [material])
            self.hitPoints = 3 // Strong threats have more hit points
        case 2:
            self.type = .powerUp
            // Appearance for power-up
            let mesh = MeshResource.generateBox(size: [0.1, 0.1, 0.1], cornerRadius: 0.025)
            let material = SimpleMaterial(color: .blue, isMetallic: true)
            self.components[ModelComponent.self] = ModelComponent(mesh: mesh, materials: [material])
        default:
            break
        }
        
        // Ensure the collision component is updated to match the new model
        self.generateCollisionShapes(recursive: false)
    }


    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
