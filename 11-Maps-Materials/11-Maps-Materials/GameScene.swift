//
//  GameScene.swift
//  11-Maps-Materials
//
//  Created by Dmitrii Shliugaev on 16/11/2022.
//


import MetalKit

struct GameScene {
    lazy var cottage: Model = {
        Model(name: "cube.obj")
    }()
    
    lazy var helmet: Model = {
      Model(name: "helmet.obj")
    }()
    var models: [Model] = []
    var camera = ArcballCamera()
    
    var defaultView: Transform {
      Transform(
        position: [1.25, 1.13, -1.42],
        rotation: [-0.32, 11.84, 0.0])
    }
    
    let lighting = SceneLighting()
    
    init() {
        camera.distance = 2
        camera.target = [0, 0.5, 0]
        camera.transform = defaultView
        models = [helmet]
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
