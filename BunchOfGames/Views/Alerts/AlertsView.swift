//
//  AlertsView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 03/09/2021.
//

import SwiftUI

struct AlertsView: View {
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.theme.accent)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    @EnvironmentObject var vm: GameViewModel
    var body: some View {
        if let alert = vm.alert {
            if alert.isEnabled && alert.type == .tutorial {
                TutorialView(alert: $vm.alert, toggleAlert: vm.toggleTutorial)
            } else if alert.type == .normal {
                CustomAlertView(alert: $vm.alert, reset: vm.resetGame)
            }
        }
    }
}

struct AlertsView_Previews: PreviewProvider {
    static var previews: some View {
        AlertsView().environmentObject(GameViewModel())
    }
}
