//
//  TextureController.swift
//  08-Textures
//
//  Created by Dmitry Shlyugaev on 22.10.2022.
//

import MetalKit

enum TextureController {
    static var textures: [String: MTLTexture] = [:]
    
    
    static func loadTexture(filename: String) throws -> MTLTexture? {
        // 1
        let textureLoader = MTKTextureLoader(device: Renderer.device)
        // 2
        let textureLoaderOptions: [MTKTextureLoader.Option: Any] = [
          .origin: MTKTextureLoader.Origin.bottomLeft,
          .SRGB: false
        ]
        // 3
        let fileExtension =
        URL(fileURLWithPath: filename).pathExtension.isEmpty ?
        "png" : nil
        // 4
        guard let url = Bundle.main.url(
            forResource: filename,
            withExtension: fileExtension)
        else {
            print("Failed to load \(filename)")
            return nil
        }
        let texture = try textureLoader.newTexture(
            URL: url,
            options: textureLoaderOptions)
        print("loaded texture: \(url.lastPathComponent)")
        return texture
    }
    
    static func texture(filename: String) -> MTLTexture? {
        if let texture = textures[filename] {
            return texture
        }
        let texture = try? loadTexture(filename: filename)
        if texture != nil {
            textures[filename] = texture
        }
        return texture
    }
}
