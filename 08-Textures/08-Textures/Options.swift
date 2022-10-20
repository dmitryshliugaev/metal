//
//  Options.swift
//  08-Textures
//
//  Created by Dmitrii Shliugaev on 22/10/2022.
//

import Foundation

enum RenderChoice {
    case train, quad
}

class Options: ObservableObject {
    @Published var renderChoice = RenderChoice.quad
}
