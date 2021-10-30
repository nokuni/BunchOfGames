//
//  ContentView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

struct MemoryGameView: View {
    @EnvironmentObject var vm: GameViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.theme.accent.ignoresSafeArea()
            VStack {
                BackButtonView(color: .theme.memoryColor)
                Title
                Board
                Buttons
                Spacer()
            }
            .blur(radius: vm.blur)
            
            AlertsView()
        }
        .onAppear { vm.alert = vm.memoryGame.tutorialAlert }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView()
            .preferredColorScheme(.light)
            .environmentObject(GameViewModel())
    }
}
