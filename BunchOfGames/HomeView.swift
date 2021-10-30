//
//  HomeView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 03/09/2021.
//

import SwiftUI

struct HomeView: View {
    @State var showOptions = false
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 40) {
                    Title
                    MemoryButton
                    OrientationButton
                }
            }
            Options
        }
        .navigationBarItems(trailing: OptionsButton)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
        .preferredColorScheme(.light)
        .environmentObject(GameViewModel())
    }
}
