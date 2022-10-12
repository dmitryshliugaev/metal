//
//  Renderer.swift
//  04-Vertex
//
//  Created by Dmitrii Shliugaev on 10/10/2022.
//

import MetalKit

class Renderer: NSObject {
    static var device: MTLDevice!
    static var commandQueue: MTLCommandQueue!
    static var library: MTLLibrary!
    var pipelineState: MTLRenderPipelineState!
    var timer: Float = 0
    
    lazy var quad: Quad = {
        Quad(device: Renderer.device, scale: 0.8)
    }()
    
    init(metalView: MTKView) {
        guard
            let device = MTLCreateSystemDefaultDevice(),
            let commandQueue = device.makeCommandQueue() else {
            fatalError("GPU not available")
        }
        Renderer.device = device
        Renderer.commandQueue = commandQueue
        metalView.device = device
        
        // create the shader function library
        let library = device.makeDefaultLibrary()
        Self.library = library
        let vertexFunction = library?.makeFunction(name: "vertex_main")
        let fragmentFunction = library?.makeFunction(name: "fragment_main")
        
        // create the pipeline state object
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        pipelineDescriptor.colorAttachments[0].pixelFormat =  metalView.colorPixelFormat
        
        // pipelineDescriptor.vertexDescriptor = MTLVertexDescriptor.defaultLayout
        
        do {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
        super.init()
        metalView.clearColor = MTLClearColor(
            red: 1.0,
            green: 1.0,
            blue: 0.8,
            alpha: 1.0)
        metalView.delegate = self
    }
}

extension Renderer: MTKViewDelegate {
    func mtkView(
        _ view: MTKView,
        drawableSizeWillChange size: CGSize) {
    }
    
    func draw(in view: MTKView) {
        guard
            let commandBuffer = Renderer.commandQueue.makeCommandBuffer(),
            let descriptor = view.currentRenderPassDescriptor,
            let renderEncoder =
                commandBuffer.makeRenderCommandEncoder(
                    descriptor: descriptor) else {
            return
        }
        
        // 1
        timer += 0.005
        var currentTime = sin(timer)
        // 2
        renderEncoder.setVertexBytes(
          &currentTime,
          length: MemoryLayout<Float>.stride,
          index: 11)
        
        renderEncoder.setRenderPipelineState(pipelineState)
        
        var count = 50
        renderEncoder.setVertexBytes(
          &count,
          length: MemoryLayout<Int>.stride,
          index: 0)
        
        renderEncoder.drawPrimitives(
          type: .point,
          vertexStart: 0,
          vertexCount: count)
        
        renderEncoder.endEncoding()
        guard let drawable = view.currentDrawable else {
            return
        }
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
