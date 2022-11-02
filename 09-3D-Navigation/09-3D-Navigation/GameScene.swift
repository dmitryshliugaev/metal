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
    
    mutating func update(deltaTime: Float) {
      ground.scale = 40
      ground.rotation.y = sin(deltaTime)
      house.rotation.y = sin(deltaTime)
    }
}
