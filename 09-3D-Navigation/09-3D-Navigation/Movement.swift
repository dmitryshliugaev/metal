//
//  Movement.swift
//  09-3D-Navigation
//
//  Created by Dmitrii Shliugaev on 05/11/2022.
//

import Foundation

protocol Movement where Self: Transformable {
}

enum Settings {
  static var rotationSpeed: Float { 2.0 }
  static var translationSpeed: Float { 3.0 }
  static var mouseScrollSensitivity: Float { 0.1 }
  static var mousePanSensitivity: Float { 0.008 }
}

extension Movement {
  func updateInput(deltaTime: Float) -> Transform {
    var transform = Transform()
    let rotationAmount = deltaTime * Settings.rotationSpeed
    let input = InputController.shared
    if input.keysPressed.contains(.leftArrow) {
      transform.rotation.y -= rotationAmount
    }
    if input.keysPressed.contains(.rightArrow) {
      transform.rotation.y += rotationAmount
    }
    return transform
  }
}
