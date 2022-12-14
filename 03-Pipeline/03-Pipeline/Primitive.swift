//
//  Primitive.swift
//  03-Pipeline
//
//  Created by Dmitrii Shliugaev on 07/10/2022.
//

import MetalKit

class Primitive {
  static func makeCube(device: MTLDevice, size: Float) -> MDLMesh {
    let allocator = MTKMeshBufferAllocator(device: device)
    let mesh = MDLMesh(boxWithExtent: [size, size, size],
                       segments: [1, 1, 1],
                       inwardNormals: false,
                       geometryType: .triangles,
                       allocator: allocator)
    return mesh
  }
}
