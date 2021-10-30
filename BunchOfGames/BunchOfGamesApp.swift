//
//  BunchOfGamesApp.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

@main
struct BunchOfGamesApp: App {
    @StateObject var vm = GameViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
