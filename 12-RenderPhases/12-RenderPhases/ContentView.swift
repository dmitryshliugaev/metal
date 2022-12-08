//
//  ContentView.swift
//  12-RenderPhases
//
//  Created by Dmitrii Shliugaev on 15/12/2022.
//

import SwiftUI

struct ContentView: View {
  @State var options = Options()

  var body: some View {
    VStack(alignment: .leading) {
      ZStack {
        MetalView(options: options)
          .border(Color.black, width: 2)
      }
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
    }
  }
}
