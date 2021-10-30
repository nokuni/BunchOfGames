//
//  IntegerExtension.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 05/09/2021.
//

import Foundation

extension Int {
    var isEven: Bool {
        self.isMultiple(of: 2)
    }
    var isOdd: Bool {
        !self.isMultiple(of: 2)
    }
}
