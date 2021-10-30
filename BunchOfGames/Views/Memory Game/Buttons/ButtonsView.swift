//
//  ButtonsView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 03/09/2021.
//

import SwiftUI

struct ButtonsView: View {
    var sequence: [Card]?
    var refreshBoard: (() -> Void)?
    var reset: (() -> Void)?
    var opacity: Double
    var body: some View {
        if sequence == nil {
            Button(action: { refreshBoard?() }) {
                ActionButtonView(image: "shuffle", action: "SHUFFLE")
                    .buttonModifier(color: opacity != 1 ? .lightGray : .theme.memoryColor, bool: opacity != 1)
            }
            .buttonStyle(PressedEffectStyle(scaling: 0.95))
        } else {
            Button(action: { reset?() }) {
                ActionButtonView(image: "arrow.triangle.2.circlepath", action: "RETRY")
                    .buttonModifier(color: opacity != 1 ? .lightGray : .theme.memoryColor, bool: opacity != 1)
            }
            .buttonStyle(PressedEffectStyle(scaling: 0.95))
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(opacity: 0.0)
    }
}
