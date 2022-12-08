//
//  Mesh.swift
//  12-RenderPhases
//
//  Created by Dmitrii Shliugaev on 15/12/2022.
//

import MetalKit

struct Mesh {
  let vertexBuffers: [MTLBuffer]
  let submeshes: [Submesh]
}

extension Mesh {
  init(mdlMesh: MDLMesh, mtkMesh: MTKMesh) {
    var vertexBuffers: [MTLBuffer] = []
    for mtkMeshBuffer in mtkMesh.vertexBuffers {
      vertexBuffers.append(mtkMeshBuffer.buffer)
    }
    self.vertexBuffers = vertexBuffers
    submeshes = zip(mdlMesh.submeshes!, mtkMesh.submeshes).map { mesh in
      Submesh(mdlSubmesh: mesh.0 as! MDLSubmesh, mtkSubmesh: mesh.1)
    }
  }
}
