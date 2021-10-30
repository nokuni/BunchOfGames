//
//  ColorSquareView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 05/09/2021.
//

import SwiftUI

struct ColorSquareView: View {
    
    @Binding var orientationGame: OrientationGame
    var index: Int
    var orientationGameLevel: Int
    var chooseSquare: ((Int) -> Void)?
    var neighborSquares: ((Int) -> [Int])?
    
    var body: some View {
        Button(action: {
            chooseSquare?(index)
        }) {
            ZStack {
                Rectangle()
                    .stroke(Color.theme.accent, lineWidth: 3)
                    .aspectRatio(1, contentMode: .fit)
                    .background(
                        Rectangle()
                            .foregroundColor(orientationGame.board[index])
                    )
                if orientationGame.startingIndex == index {
                    Image(systemName: "ladybug.fill")
                        .font(.title)
                }
            }
            .overlay(
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundColor(neighborSquares!(orientationGame.startingIndex).contains(index) && orientationGame.board[index] != .theme.orientationColor ? Color.theme.orientationColor : .clear)
                    .opacity(0.4)
            )
        }
    }
}

//struct ColorSquareView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorSquareView(startingIndex: .constant(0), colors: .constant([]), index: 0)
//    }
//}
