//
//  Model.swift
//  08-Textures
//
//  Created by Dmitrii Shliugaev on 22/10/2022.
//


import MetalKit

class Model: Transformable {
    var transform = Transform()
    let meshes: [Mesh]
    let name: String
    
    init(name: String) {
        guard let assetURL = Bundle.main.url(
            forResource: name,
            withExtension: nil) else {
            fatalError("Model: \(name) not found")
        }
        let allocator = MTKMeshBufferAllocator(device: Renderer.device)
        let asset = MDLAsset(
            url: assetURL,
            vertexDescriptor: .defaultLayout,
            bufferAllocator: allocator)
        let (mdlMeshes, mtkMeshes) = try! MTKMesh.newMeshes(
            asset: asset,
            device: Renderer.device)
        meshes = zip(mdlMeshes, mtkMeshes).map {
            Mesh(mdlMesh: $0.0, mtkMesh: $0.1)
        }
        self.name = name
    }
}

// Rendering
extension Model {
    
    func render(
        encoder: MTLRenderCommandEncoder,
        uniforms vertex: Uniforms,
        params fragment: Params
    ) {
        var uniforms = vertex
        var params = fragment
        
        uniforms.modelMatrix = transform.modelMatrix
        
        encoder.setVertexBytes(
            &uniforms,
            length: MemoryLayout<Uniforms>.stride,
            index: UniformsBuffer.index)
        
        encoder.setFragmentBytes(
            &params,
            length: MemoryLayout<Uniforms>.stride,
            index: ParamsBuffer.index)
        
        for mesh in meshes {
            for (index, vertexBuffer) in mesh.vertexBuffers.enumerated() {
                encoder.setVertexBuffer(
                    vertexBuffer,
                    offset: 0,
                    index: index)
            }
            
            for submesh in mesh.submeshes {
                
                // set the fragment texture here
                
                encoder.drawIndexedPrimitives(
                    type: .triangle,
                    indexCount: submesh.indexCount,
                    indexType: submesh.indexType,
                    indexBuffer: submesh.indexBuffer,
                    indexBufferOffset: submesh.indexBufferOffset
                )
            }
        }
    }
}
