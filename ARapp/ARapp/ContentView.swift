//
//  ContentView.swift
//  ARapp
//
//  Created by Dmitrii Shliugaev on 08/10/2022.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @EnvironmentObject var data: DataModel
    var body: some View {
        VStack {
            if data.enableAR {
                ARDisplayView()
            } else {
                Spacer()
            }
            ARUIView()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
