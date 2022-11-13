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
    
    let ambientLight: Light = {
        var light = Self.buildDefaultLight()
        light.color = [0.05, 0.1, 0]
        light.type = Ambient
        return light
    }()
    
    init() {
        lights.append(sunlight)
        lights.append(ambientLight)
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
