//
//  MemoryGameModel.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

struct MemoryGame {
    var board: [Card]
    var frames: [CGRect]
    var sequence: [Card]?
    var opacity: Double
    var difficulty: Difficulty
    var errorCount: Int?
    var diversity: Int?
    var tutorialAlert: AlertModel?
    var winAlert: AlertModel?
}
