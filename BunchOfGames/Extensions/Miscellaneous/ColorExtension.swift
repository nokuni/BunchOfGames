//
//  ColorExtension.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

extension Color {
    static let iceBlue = Color(red: 81 / 255, green: 196 / 255, blue: 231 / 255)
    static let lightGray = Color(UIColor.systemGray4)
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let memoryColor = Color("MemoryColor")
    let orientationColor = Color("OrientationColor")
    let houseColor = Color("HouseColor")
    let flameColor = Color("FlameColor")
    let tortoiseColor = Color("TortoiseColor")
    let giftColor = Color("GiftColor")
    let gameControllerColor = Color("GameControllerColor")
    let blockColor = Color("BlockColor")
}
