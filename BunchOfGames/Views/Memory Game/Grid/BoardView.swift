//
//  BoardView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

struct BoardView: View {
    
    private let grid = [GridItem](repeating: GridItem(.flexible()), count: 3)
    @Binding var memoryGame: MemoryGame
    var onEnded: ((CGPoint, Int, Card) -> Void)?
    func overlay(_ index: Int) -> some View {
        GeometryReader { geometry in
            Color.clear
                .onChange(of: geometry.frame(in: .global)) { value in
                    memoryGame.frames[index] = geometry.frame(in: .global)
                }
        }
    }
    
    var body: some View {
        LazyVGrid(columns: grid, spacing: 10) {
            ForEach(memoryGame.board.indices, id: \.self) { index in
                SquareGestureView(index: index, square: memoryGame.board[index], onEnded: onEnded)
                    .allowsHitTesting(memoryGame.sequence != nil)
                    .overlay(overlay(index))
            }
        }
        .padding(.horizontal, 5)
        .opacity(memoryGame.opacity)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(memoryGame: .constant(MemoryGame.defaultGame))
    }
}

//.allowsHitTesting(vm.memoryGame.sequence != nil)
//.overlay(GeometryReader { geo in
//    Color.clear
//        .onAppear {
//            vm.memoryGame.frames[index] = geo.frame(in: .global)
//        }
//})
