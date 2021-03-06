//
//  ArrayExtension.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 05/09/2021.
//

import Foundation

extension Array {
    func separate(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
