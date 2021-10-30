//
//  ViewExtensions.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

extension View {
    func buttonModifier(color: Color, bool: Bool) -> some View {
        modifier(CustomButtonModifier(color: color, bool: bool))
    }
}
