//
//  Camera.swift
//  09-3D-Navigation
//
//  Created by Dmitrii Shliugaev on 04/11/2022.
//

import CoreGraphics

protocol Camera: Transformable {
    var projectionMatrix: float4x4 { get }
    var viewMatrix: float4x4 { get }
    mutating func update(size: CGSize)
    mutating func update(deltaTime: Float)
}

struct FPCamera: Camera {
    var transform = Transform()
    
    var aspect: Float = 1.0
    var fov = Float(70).degreesToRadians
    var near: Float = 0.1
    var far: Float = 100
    var projectionMatrix: float4x4 {
        float4x4(
            projectionFov: fov,
            near: near,
            far: far,
            aspect: aspect)
    }
    
    mutating func update(size: CGSize) {
        aspect = Float(size.width / size.height)
    }
    
    var viewMatrix: float4x4 {
        (float4x4(rotation: rotation) *
         float4x4(translation: position)).inverse
    }
    
    mutating func update(deltaTime: Float) {
    }
}
