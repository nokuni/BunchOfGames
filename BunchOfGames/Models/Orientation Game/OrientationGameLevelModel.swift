//
//  OrientationGameLevelModel.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 13/09/2021.
//

import Foundation

struct OrientationGameLevel {
    let gridCount: Int
    let start: Int
    let blocksIndice: [Int]
    
    var boardSize: Int { gridCount * gridCount }
}
