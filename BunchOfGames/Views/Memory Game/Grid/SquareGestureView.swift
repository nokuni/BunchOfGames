//
//  SquareGestureView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

struct SquareGestureView: View {
    @State var dragAmount: CGSize = .zero
    var index: Int
    var square: Card
    
    var onChanged: ((Int, Card, CGPoint) -> Void)?
    var onEnded: ((CGPoint, Int, Card) -> Void)?
    var gesture: some Gesture {
        DragGesture(coordinateSpace: .global)
            .onChanged {
                dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
            }
            .onEnded {
                onEnded?($0.location, index, square)
                dragAmount = .zero
            }
    }
    var body: some View {
        ZStack {
            Image(systemName: square.image)
                .foregroundColor(square.color)
                .font(.system(size: UIScreen.main.bounds.width / 6.5))
        }
        .frame(width: UIScreen.main.bounds.width / 3.3, height: UIScreen.main.bounds.width / 3.3)
        .background(
            Color.theme.accent
                .cornerRadius(15)
                .shadow(color: Color.theme.memoryColor, radius: 2)
        )
        .zIndex(dragAmount == .zero ? 0 : 1)
        .offset(dragAmount)
        .gesture(gesture)
    }
}

struct SquareGestureView_Previews: PreviewProvider {
    static var previews: some View {
        SquareGestureView(index: 0, square: Card(image: "flame.fill", color: .theme.houseColor))
    }
}
