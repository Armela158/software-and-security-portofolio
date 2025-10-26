//
//  CyberThreat.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 26/04/2024.
//
import Foundation

struct CyberThreat: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    let description: String
}

struct CyberThreat1: Hashable, Identifiable {
    let id = UUID() // Give a default value for id
    let title: String
    let description: String
    let preventionTips: String
    let imageName: String
}
