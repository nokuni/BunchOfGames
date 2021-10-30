//
//  OrientationGameExtension.swift.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 06/09/2021.
//

import SwiftUI

extension OrientationGame {
    static let defaultGame = OrientationGame(grid: [], board: [], startingIndex: 0, levels: levels, tutorialAlert: AlertModel.orientationGameTutorial, winAlert: AlertModel.orientationGameWin)
    
    static let levels: [OrientationGameLevel] = [
        OrientationGameLevel(gridCount: 5, start: 0, blocksIndice: [12]),
        OrientationGameLevel(gridCount: 5, start: 12, blocksIndice: [9, 20]),
        OrientationGameLevel(gridCount: 5, start: 22, blocksIndice: [4, 7, 10]),
        OrientationGameLevel(gridCount: 5, start: 1, blocksIndice: [0, 4, 19, 24])
    ]
}
