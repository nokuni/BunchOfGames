//
//  GameViewExtension.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

extension MemoryGameView {
    var Title: some View {
        Text(vm.memoryGame.sequence == nil ? "MEMORIZE" : "RECREATE")
            .foregroundColor(.theme.memoryColor)
            .font(.system(size: 50, weight: .heavy, design: .rounded))
            .padding()
    }
    var Board: some View {
        BoardView(memoryGame: $vm.memoryGame, onEnded: vm.squareDropped)
    }
    var Buttons: some View {
        ButtonsView(sequence: vm.memoryGame.sequence, refreshBoard: vm.refreshBoard, reset: vm.resetMemoryGame, opacity: vm.memoryGame.opacity)
    }
    var Alerts: some View {
        AlertsView()
    }
}
