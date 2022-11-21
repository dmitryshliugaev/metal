//
//  GameScene.swift
//  11-Maps-Materials
//
//  Created by Dmitrii Shliugaev on 16/11/2022.
//


import MetalKit

struct GameScene {
  lazy var cottage: Model = {
    Model(name: "cottage2.obj")
  }()
  var models: [Model] = []
  var camera = ArcballCamera()

  var defaultView: Transform {
    Transform(
      position: [4.6, 2.3, -3.84],
      rotation: [-0.05, 11.7, 0.0])
  }

  let lighting = SceneLighting()

  init() {
    camera.distance = 6
    camera.target = [0, 2.2, 0]
    camera.transform = defaultView
    models = [cottage]
  }

  mutating func update(size: CGSize) {
    camera.update(size: size)
  }

  mutating func update(deltaTime: Float) {
    let input = InputController.shared
    if input.keysPressed.contains(.one) {
      camera.transform = Transform()
    }
    if input.keysPressed.contains(.two) {
      camera.transform = defaultView
    }
    camera.update(deltaTime: deltaTime)
  }
}
