//
//  SceneLighting.swift
//  10-Lighting
//
//  Created by Dmitrii Shliugaev on 12/11/2022.
//

import Foundation

struct SceneLighting {
    var lights: [Light] = []
    
    let sunlight: Light = {
      var light = Self.buildDefaultLight()
      light.position = [1, 2, -2]
      return light
    }()
    
    init() {
      lights.append(sunlight)
    }
    
    static func buildDefaultLight() -> Light {
        var light = Light()
        light.position = [0, 0, 0]
        light.color = [1, 1, 1]
        light.specularColor = [0.6, 0.6, 0.6]
        light.attenuation = [1, 0, 0]
        light.type = Sun
        return light
    }
}
