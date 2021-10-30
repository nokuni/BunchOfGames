//
//  ActionButtonView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

struct ActionButtonView: View {
    var image: String
    var action: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.theme.accent)
                .font(.title)
            Text(action)
                .font(.system(size: 30, weight: .heavy, design: .rounded))
                .foregroundColor(.theme.accent)
        }
        .frame(maxWidth: .infinity, minHeight: 60, alignment: .leading)
        .padding(.leading)
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(image: "cloud.fill", action: "action")
    }
}
