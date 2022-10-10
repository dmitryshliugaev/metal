//
//  Quad.swift
//  04-Vertex
//
//  Created by Dmitrii Shliugaev on 10/10/2022.
//

import MetalKit

struct Quad {
    let vertexBuffer: MTLBuffer

    init(device: MTLDevice, scale: Float = 1) {
      vertices = vertices.map {
        $0 * scale
      }
      guard let vertexBuffer = device.makeBuffer(
        bytes: &vertices,
        length: MemoryLayout<Float>.stride * vertices.count,
        options: []) else {
        fatalError("Unable to create quad vertex buffer")
      }
      self.vertexBuffer = vertexBuffer
    }
    
  var vertices: [Float] = [
    -1,  1,  0,    // triangle 1
     1, -1,  0,
    -1, -1,  0,
    -1,  1,  0,    // triangle 2
     1,  1,  0,
     1, -1,  0
  ]
}


