//
//  AlertModelExtension.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 06/09/2021.
//

import Foundation

extension AlertModel {
    static let defaultAlert = AlertModel(title: "Title", message: "Message", messageList: ["Default", "Message"], actionLabel: "Action", theme: .theme.memoryColor, type: .normal, isEnabled: true)
    
    static let memoryGameTutorial = AlertModel(message: "Have fun !", messageList: ["Memorize the sequence.", "Shuffle it !", "Try to recreate it exactly by dragging the cards.", "If you don't know the sequence anymore, you can retry with a new sequence."], actionLabel: "START", theme: .theme.memoryColor, type: .tutorial, isEnabled: true)

    static let orientationGameTutorial = AlertModel(message: "Good Luck !", messageList: ["Mrs.Ladybug needs your help !", "You have to light up all the ways", "Just tap on a path block to light it up", "You can only light up paths adjacent to Mrs.LadyBug.", "You cannot move Mrs.Ladybug on an already lighted up block.", "Beware, there are paths that can't be lighted up."], actionLabel: "START", theme: .theme.orientationColor, type: .tutorial, isEnabled: true)

    static let memoryGameWin = AlertModel(title: "Congratulation !", actionLabel: "Continue", theme: .theme.memoryColor, type: .normal, isEnabled: true)
    
    static let orientationGameWin = AlertModel(title: "Congratulation !", actionLabel: "Continue", theme: .theme.orientationColor, type: .normal, isEnabled: true)
}
