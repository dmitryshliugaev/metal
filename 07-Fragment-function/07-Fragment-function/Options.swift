//
//  Options.swift
//  07-Fragment-function
//
//  Created by Dmitrii Shliugaev on 17/10/2022.
//

import Foundation

enum RenderChoice {
  case train, quad
}

class Options: ObservableObject {
  @Published var renderChoice = RenderChoice.quad
}
