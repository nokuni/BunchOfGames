//
//  CustomViewModifiers.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    var color: Color
    var bool: Bool
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(color)
            )
            .padding(12)
            .disabled(bool)
    }
}

struct PressedEffectStyle: ButtonStyle {
    var scaling: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaling : 1)
    }
}
