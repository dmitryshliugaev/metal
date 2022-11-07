//
//  GameScene.swift
//  09-3D-Navigation
//
//  Created by Dmitrii Shliugaev on 02/11/2022.
//

import MetalKit

struct GameScene {
    lazy var house: Model = {
        Model(name: "lowpoly-house.obj")
    }()
    lazy var ground: Model = {
        var ground = Model(name: "plane.obj")
        ground.tiling = 16
        ground.scale = 40
        return ground
    }()
    lazy var models: [Model] = [ground, house]
    
    var camera = ArcballCamera()
    
    mutating func update(deltaTime: Float) {
        ground.scale = 40
        camera.update(deltaTime: deltaTime)

        if InputController.shared.keysPressed.contains(.keyH) {
          print("H key pressed")
        }
    }
    
    init() {
        camera.position = [0, 1.5, -5]
        camera.distance = length(camera.position)
        camera.target = [0, 1.2, 0]
    }
    
    mutating func update(size: CGSize) {
        camera.update(size: size)
    }
}
