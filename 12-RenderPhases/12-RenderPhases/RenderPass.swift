//
//  RenderPass.swift
//  12-RenderPhases
//
//  Created by Dmitrii Shliugaev on 16/12/2022.
//

import MetalKit

protocol RenderPass {
  var label: String { get }
  var descriptor: MTLRenderPassDescriptor? { get set }
  mutating func resize(view: MTKView, size: CGSize)
  func draw(
    commandBuffer: MTLCommandBuffer,
    scene: GameScene,
    uniforms: Uniforms,
    params: Params
  )
}

extension RenderPass {
}
