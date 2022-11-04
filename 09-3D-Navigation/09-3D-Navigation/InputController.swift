//
//  InputController.swift
//  09-3D-Navigation
//
//  Created by Dmitrii Shliugaev on 05/11/2022.
//

import GameController

class InputController {
    var keysPressed: Set<GCKeyCode> = []
    static let shared = InputController()
    
    private init() {
        let center = NotificationCenter.default
        center.addObserver(
            forName: .GCKeyboardDidConnect,
            object: nil,
            queue: nil) { notification in
                let keyboard = notification.object as? GCKeyboard
                keyboard?.keyboardInput?.keyChangedHandler
                = { _, _, keyCode, pressed in
                    if pressed {
                        self.keysPressed.insert(keyCode)
                    } else {
                        self.keysPressed.remove(keyCode)
                    }
                }
            }
    }
}
