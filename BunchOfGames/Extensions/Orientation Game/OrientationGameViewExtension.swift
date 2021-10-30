//
//  OrientationViewExtension.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 07/09/2021.
//

import SwiftUI

extension OrientationGameView {
    var Title: some View {
        Text("Light up")
            .foregroundColor(.theme.orientationColor)
            .font(.system(size: 50, weight: .heavy, design: .rounded))
    }
    var Board: some View {
        OrientationBoardView(orientationGame: $vm.orientationGame, orientationGameLevel: vm.orientationGameLevel, chooseSquare: vm.chooseSquare, getNeighbor: vm.getNeighbor)
    }
    var RetryButton: some View {
        Button(action: { vm.resetOrientationGame() }) {
            ActionButtonView(image: "arrow.triangle.2.circlepath", action: "Retry")
                .buttonModifier(color: .theme.orientationColor, bool: true)
        }
        .buttonStyle(PressedEffectStyle(scaling: 0.95))
    }
    var Alerts: some View {
        AlertsView()
    }
}
