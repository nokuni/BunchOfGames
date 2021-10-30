//
//  LightBoardView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 05/09/2021.
//

import SwiftUI

struct OrientationBoardView: View {
    @Binding var orientationGame: OrientationGame
    var orientationGameLevel: Int
    var chooseSquare: ((Int) -> Void)?
    var getNeighbor: ((Int) -> [Int])?
    var body: some View {
        LazyVGrid(columns: orientationGame.grid) {
            ForEach(orientationGame.board.indices, id: \.self) { index in
                ColorSquareView(orientationGame: $orientationGame, index: index, orientationGameLevel: orientationGameLevel, chooseSquare: chooseSquare, neighborSquares: getNeighbor)
            }
        }
        .border(Color.theme.orientationColor, width: 1)
        .padding(.horizontal)
    }
}

struct OrientationBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OrientationBoardView(orientationGame: .constant(OrientationGame.defaultGame), orientationGameLevel: 0)
            .environmentObject(GameViewModel())
    }
}
