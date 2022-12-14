//
//  ContentView.swift
//  04-Vertex
//
//  Created by Dmitrii Shliugaev on 10/10/2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      MetalView()
        .border(Color.black, width: 2)
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
      .environment(\.sizeCategory, .accessibilityLarge)
  }
}
