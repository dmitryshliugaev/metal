//
//  ContentView.swift
//  09-3D-Navigation
//
//  Created by Dmitrii Shliugaev on 02/11/2022.
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
