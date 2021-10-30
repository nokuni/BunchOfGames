//
//  MemoryGameExtension.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 06/09/2021.
//

import SwiftUI

extension MemoryGame {
    static let defaultGame = MemoryGame(board: [], frames: [CGRect](repeating: .zero, count: 9), sequence: nil, opacity: 1, difficulty: .easy, errorCount: nil, diversity: nil, tutorialAlert: AlertModel.memoryGameTutorial, winAlert: AlertModel.memoryGameWin)
}
