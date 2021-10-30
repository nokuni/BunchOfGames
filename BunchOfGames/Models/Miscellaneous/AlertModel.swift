//
//  AlertModel.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

struct AlertModel: Equatable {
    var title: String?
    var message: String?
    var messageList: [String]?
    var actionLabel: String
    var theme: Color
    var type: AlertType
    var isEnabled: Bool
}

enum AlertType {
    case normal
    case tutorial
}
