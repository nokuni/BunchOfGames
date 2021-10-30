//
//  LightGameModel.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 05/09/2021.
//

import SwiftUI

struct OrientationGame {
    var grid: [GridItem]
    var board: [Color]
    var startingIndex: Int
    var levels: [OrientationGameLevel]
    var tutorialAlert: AlertModel?
    var winAlert: AlertModel?
}


