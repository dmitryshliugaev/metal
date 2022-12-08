//
//  SceneLighting.swift
//  12-RenderPhases
//
//  Created by Dmitrii Shliugaev on 15/12/2022.
//

import Foundation

struct SceneLighting {
  static func buildDefaultLight() -> Light {
    var light = Light()
    light.position = [0, 0, 0]
    light.color = float3(repeating: 1.0)
    light.specularColor = float3(repeating: 0.6)
    light.attenuation = [1, 0, 0]
    light.type = Sun
    return light
  }

  let sunlight: Light = {
    var light = Self.buildDefaultLight()
    light.position = [3, 3, -2]
    light.color = float3(repeating: 1)
    return light
  }()

  let fillLight: Light = {
    var light = Self.buildDefaultLight()
    light.position = [-5, 1, 3]
    light.color = float3(repeating: 0.5)
    return light
  }()

  var lights: [Light] = []

  init() {
    lights = [sunlight, fillLight]
  }
}
