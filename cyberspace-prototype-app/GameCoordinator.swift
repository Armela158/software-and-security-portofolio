//
//  GameCoordinator.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 21/04/2024.
//

// GameCoordinator.swift

import RealityKit
import Combine

class GameCoordinator: ObservableObject {
    @Published var score = 0
    @Published var currency = 0
    @Published var powerUpActive = false
    
    func placeThreatEntity(at transform: simd_float4x4, in arView: ARView) {
        let threatEntity = ThreatEntity()
        threatEntity.position = simd_make_float3(transform.columns.3)
        arView.scene.addAnchor(threatEntity)
    }
    
    func tapped(entity: ThreatEntity?) {
        guard let entity = entity else { return }
        switch entity.type {
        case .normal:
            score += 10
            entity.removeFromParent()
        case .strong:
            entity.hitPoints -= 1
            if entity.hitPoints == 0 {
                score += 20
                entity.removeFromParent()
            }
        case .powerUp:
            currency += 50
            powerUpActive = true
            // Add logic to end the power-up after some time if necessary
        }
    }
}
