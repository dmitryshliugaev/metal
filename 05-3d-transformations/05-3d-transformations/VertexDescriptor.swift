//
//  VertexDescriptor.swift
//  05-3d-transformations
//
//  Created by Dmitrii Shliugaev on 13/10/2022.
//

import MetalKit

extension MTLVertexDescriptor {
  static var defaultLayout: MTLVertexDescriptor {
    let vertexDescriptor = MTLVertexDescriptor()
    vertexDescriptor.attributes[0].format = .float3
    vertexDescriptor.attributes[0].offset = 0
    vertexDescriptor.attributes[0].bufferIndex = 0

    let stride = MemoryLayout<Float>.stride * 3
    vertexDescriptor.layouts[0].stride = stride
    return vertexDescriptor
  }
}
