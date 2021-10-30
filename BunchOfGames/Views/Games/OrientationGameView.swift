//
//  TestView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 03/09/2021.
//

import SwiftUI

struct OrientationGameView: View {
    @EnvironmentObject var vm: GameViewModel
    var body: some View {
        ZStack {
            Color.theme.accent.ignoresSafeArea()
            VStack {
                BackButtonView(color: .theme.orientationColor)
                Title
                Text("Level \(vm.orientationGameLevel + 1)")
                    .foregroundColor(.theme.orientationColor)
                    .font(.system(size: 20, weight: .heavy, design: .rounded))
                Board
                RetryButton
                Spacer()
            }
            .blur(radius: vm.blur)
            
            Alerts
        }
        .onAppear { vm.alert = vm.orientationGame.tutorialAlert }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OrientationGameView_Previews: PreviewProvider {
    static var previews: some View {
        OrientationGameView()
            .preferredColorScheme(.light)
            .environmentObject(GameViewModel())
    }
}
