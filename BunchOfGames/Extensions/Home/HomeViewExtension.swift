//
//  HomeViewExtension.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 07/09/2021.
//

import SwiftUI

extension HomeView {
    var Title: some View {
        Text("Bunch of games")
            .font(.system(size: 40, weight: .heavy, design: .rounded))
    }
    
    var MemoryButton: some View {
        NavigationLink(destination: MemoryGameView()) {
            HomeButtonView(name: "Memory", theme: .theme.memoryColor)
        }
        .buttonStyle(PressedEffectStyle(scaling: 0.95))
    }
    
    var OrientationButton: some View {
        NavigationLink(destination: OrientationGameView()) {
            HomeButtonView(name: "Orientation", theme: .theme.orientationColor)
        }
        .buttonStyle(PressedEffectStyle(scaling: 0.95))
    }
    
    var Options: some View {
        OptionsView(isShowingOptions: $showOptions)
    }
    
    var OptionsButton: some View {
        Image(systemName: "gear")
            .resizable()
            .foregroundColor(.primary)
            .frame(width: 40, height: 40)
            .onTapGesture { showOptions.toggle() }
    }
}
