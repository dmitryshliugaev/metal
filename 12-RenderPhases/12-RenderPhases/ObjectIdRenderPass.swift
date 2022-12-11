//
//  ObjectIdRenderPass.swift
//  12-RenderPhases
//
//  Created by Dmitrii Shliugaev on 16/12/2022.
//

import MetalKit

struct ObjectIdRenderPass: RenderPass {
    let label = "Object ID Render Pass"
    var descriptor: MTLRenderPassDescriptor?
    var pipelineState: MTLRenderPipelineState
    var idTexture: MTLTexture?
    
    mutating func resize(view: MTKView, size: CGSize) {
        idTexture = Self.makeTexture(
          size: size,
          pixelFormat: .r32Uint,
          label: "ID Texture")
    }
    
    init() {
        pipelineState = PipelineStates.createObjectIdPSO()
        descriptor = MTLRenderPassDescriptor()
    }
    
    func draw(
        commandBuffer: MTLCommandBuffer,
        scene: GameScene,
        uniforms: Uniforms,
        params: Params
    ) {
        guard let descriptor = descriptor else {
          return
        }
        descriptor.colorAttachments[0].texture = idTexture
        guard let renderEncoder =
          commandBuffer.makeRenderCommandEncoder(descriptor: descriptor)
        else { return }
        
        renderEncoder.label = label
        renderEncoder.setRenderPipelineState(pipelineState)
        for model in scene.models {
          model.render(
            encoder: renderEncoder,
            uniforms: uniforms,
            params: params)
        }
        renderEncoder.endEncoding()
    }
}
