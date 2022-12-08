//
//  GameScene.swift
//  12-RenderPhases
//
//  Created by Dmitrii Shliugaev on 15/12/2022.
//

import MetalKit

struct GameScene {
  static var objectId: UInt32 = 1
  lazy var train: Model = {
    createModel(name: "train.obj")
  }()
  lazy var treefir1: Model = {
    createModel(name: "treefir.obj")
  }()
  lazy var treefir2: Model = {
    createModel(name: "treefir.obj")
  }()
  lazy var treefir3: Model = {
    createModel(name: "treefir.obj")
  }()
  lazy var ground: Model = {
    Model(name: "large_plane.obj", objectId: 0)
  }()

  var models: [Model] = []
  var camera = ArcballCamera()

  var defaultView: Transform {
    Transform(
      position: [3.2, 3.1, 1.0],
      rotation: [-0.6, 10.7, 0.0])
  }

  var lighting = SceneLighting()

  init() {
    camera.transform = defaultView
    camera.target = [0, 1, 0]
    camera.distance = 4
    treefir1.position = [-1, 0, 2.5]
    treefir2.position = [-3, 0, -2]
    treefir3.position = [1.5, 0, -0.5]
    models = [treefir1, treefir2, treefir3, train, ground]
  }

  func createModel(name: String) -> Model {
    let model = Model(name: name, objectId: Self.objectId)
    Self.objectId += 1
    return model
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
