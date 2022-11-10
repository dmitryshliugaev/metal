//
//  Movement.swift
//  10-Lighting
//
//  Created by Dmitrii Shliugaev on 11/11/2022.
//

import Foundation

enum Settings {
    static var rotationSpeed: Float { 2.0 }
    static var translationSpeed: Float { 3.0 }
    static var mouseScrollSensitivity: Float { 0.1 }
    static var mousePanSensitivity: Float { 0.008 }
    static var touchZoomSensitivity: Float { 10 }
}

protocol Movement where Self: Transformable {
}

extension Movement {
    var forwardVector: float3 {
        normalize([sin(rotation.y), 0, cos(rotation.y)])
    }
    var rightVector: float3 {
        [forwardVector.z, forwardVector.y, -forwardVector.x]
    }
    
    func updateInput(deltaTime: Float) -> Transform {
        let input = InputController.shared
        var transform = Transform()
        let rotationAmount = deltaTime * Settings.rotationSpeed
        if input.keysPressed.contains(.leftArrow) {
            transform.rotation.y -= rotationAmount
        }
        if input.keysPressed.contains(.rightArrow) {
            transform.rotation.y += rotationAmount
        }
        var direction: float3 = .zero
        if input.keysPressed.contains(.keyW) {
            direction.z += 1
        }
        if input.keysPressed.contains(.keyS) {
            direction.z -= 1
        }
        if input.keysPressed.contains(.keyA) {
            direction.x -= 1
        }
        if input.keysPressed.contains(.keyD) {
            direction.x += 1
        }
        let translationAmount = deltaTime * Settings.translationSpeed
        if direction != .zero {
            direction = normalize(direction)
            transform.position += (direction.z * forwardVector
                                   + direction.x * rightVector) * translationAmount
        }
        return transform
    }
}
