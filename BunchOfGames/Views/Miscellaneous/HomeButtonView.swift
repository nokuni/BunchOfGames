//
//  HomeButtonView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 07/09/2021.
//

import SwiftUI

struct HomeButtonView: View {
    var name: String
    var theme: Color
    var body: some View {
        Text(name)
            .bold()
            .font(.system(size: 30, weight: .heavy, design: .rounded))
            .foregroundColor(.accentColor)
            .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
            .padding(.leading)
            .background(
                theme
                    .cornerRadius(15)
            )
            .padding(.horizontal)
    }
}

struct HomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtonView(name: "Preview", theme: .theme.accent)
    }
}
