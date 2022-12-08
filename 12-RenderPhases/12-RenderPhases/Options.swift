//
//  Options.swift
//  12-RenderPhases
//
//  Created by Dmitrii Shliugaev on 15/12/2022.
//

import Foundation

enum RenderChoice {
  case train, quad
}

class Options: ObservableObject {
  @Published var renderChoice = RenderChoice.quad
}
