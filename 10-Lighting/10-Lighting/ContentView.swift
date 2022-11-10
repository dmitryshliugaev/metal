//
//  ContentView.swift
//  10-Lighting
//
//  Created by Dmitrii Shliugaev on 11/11/2022.
//

import SwiftUI

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

enum RenderChoice {
  case train, quad
}

class Options: ObservableObject {
  @Published var renderChoice = RenderChoice.quad
}

