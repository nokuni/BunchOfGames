//
//  BackButtonView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 04/09/2021.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    var color: Color
    var body: some View {
        HStack {
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .foregroundColor(.theme.accent)
                    .font(.largeTitle)
                    .padding()
                    .background(
                        color
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    )
            }
            .buttonStyle(PressedEffectStyle(scaling: 0.95))
            Spacer()
        }
        .padding(.leading, 5)
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(color: .theme.memoryColor)
    }
}
