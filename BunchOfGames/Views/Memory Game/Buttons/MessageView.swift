//
//  MessageView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

struct MessageView: View {
    var message: String
    var color: Color
    var body: some View {
        Text(message)
            .foregroundColor(color)
            .bold()
            .font(.title)
            .frame(width: 250)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: "If you don't know the sequence anymore, you can retry with a new sequence.", color: .blue)
    }
}
