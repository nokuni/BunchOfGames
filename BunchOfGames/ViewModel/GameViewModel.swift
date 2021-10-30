//
//  GameViewModel.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    
    @Published var memoryGame = MemoryGame.defaultGame
    @Published var orientationGame = OrientationGame.defaultGame
    @Published var orientationGameLevel: Int = 0
    
    @Published var alert: AlertModel? = nil
    
    //static let grid = [GridItem](repeating: GridItem(.flexible()), count: orientationGame.difficulty)
    
    var blur: CGFloat {
        if let alert = self.alert {
            if alert.isEnabled {
                return 3.0
            }
        }
        return 0.0
    }
    func resetAlert() { alert = nil }
    func resetGame() {
        switch alert {
        case memoryGame.winAlert:
            resetMemoryGame()
        case orientationGame.winAlert:
            resetOrientationGame()
        default:
            ()
        }
    }
    func toggleTutorial() {
        if let unwrappedAlert = self.alert {
            switch unwrappedAlert {
            case memoryGame.tutorialAlert:
                alert?.isEnabled.toggle()
                memoryGame.tutorialAlert?.isEnabled.toggle()
            case orientationGame.tutorialAlert:
                alert?.isEnabled.toggle()
                orientationGame.tutorialAlert?.isEnabled.toggle()
            default:
                ()
            }
        }
    }
    
    // Memory Game
    var cancellables = Set<AnyCancellable>()
    func refreshBoard() {
        Timer
            .publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.memoryGame.opacity > 0 { self.memoryGame.opacity -= 0.1 } else {
                    self.setSequence()
                    self.shuffleBoard()
                    self.memoryGame.opacity = 1
                    self.cancellables.forEach { $0.cancel() }
                    self.cancellables.removeAll()
                }
            }
            .store(in: &cancellables)
    }
    func setSequence() { memoryGame.sequence = memoryGame.board }
    func shuffleBoard() {
        memoryGame.board.shuffle()
        // Keep reshuffling until board is not equal to sequence.
        repeat {
            memoryGame.board.shuffle()
        } while memoryGame.board == memoryGame.sequence
    }
    
    // Check if the sequence of cards is equal to the user sequence
    func checkSequence() {
        guard let unwrappedSequence = memoryGame.sequence else { return }
        // differences represents the indices of wrong card placements.
        let differences = zip(unwrappedSequence, memoryGame.board).enumerated().filter() { $1.0 != $1.1 }.map { $0.0 }
        memoryGame.errorCount = differences.count
        if memoryGame.errorCount == 0 {
            alert = memoryGame.winAlert
        }
    }
    func squareDropped(location: CGPoint, index: Int, square: Card) {
        if let match = memoryGame.frames.firstIndex(where: { $0.contains(location) }) {
            memoryGame.board[index] = memoryGame.board[match]
            memoryGame.board[match] = square
            checkSequence()
        }
    }
    func resetMemoryGame() {
        memoryGame.board.removeAll()
        resetAlert()
        memoryGame.sequence = nil
        memoryGame.errorCount = nil
        memoryGame.diversity = memoryGame.difficulty.rawValue
        fillBoard()
    }
    func fillBoard() {
        var cards = [Card]()
        
        guard let diversityCount = memoryGame.diversity else { return }
        
        // Add cards to the card array above until all cards are differents and respect the diversity.
        repeat {
            guard let randomCard = memoryImages.randomElement() else { return }
            if !cards.contains(randomCard) { cards.append(randomCard) }
        } while cards.count < diversityCount
        
        // Add a random card, from the cards array above, to our board.
        repeat {
            if let randomCard = cards.randomElement() { memoryGame.board.append(randomCard) }
        } while memoryGame.board.count < 9
    }
    
    // Orientation Game
    var columnsIndices: [[Int]] {
        var separatedBoardIndices = Array(orientationGame.board.indices).separate(into: orientationGame.levels[orientationGameLevel].gridCount)
        var columns = [[Int]](repeating: [], count: orientationGame.levels[orientationGameLevel].gridCount)
        
        for i in separatedBoardIndices.indices {
            for index in separatedBoardIndices.indices {
                if let firstIndex = separatedBoardIndices[index].first {
                    columns[i].append(firstIndex)
                    separatedBoardIndices[index].removeFirst()
                }
            }
        }
        return columns
    }
    func getNeighbor(location: Int) -> [Int] {
        guard let row = Array(orientationGame.board.indices).separate(into: orientationGame.levels[orientationGameLevel].gridCount).first(where: { $0.contains(location) }) else { return [] }
        guard let column = columnsIndices.first(where: { $0.contains(location) }) else { return [] }
        
        let bottom = location + orientationGame.levels[orientationGameLevel].gridCount
        let top = location - orientationGame.levels[orientationGameLevel].gridCount
        let left = location - 1
        let right = location + 1
        
        let result = [bottom, top, left, right].filter { row.contains($0) || column.contains($0) }
        return result
    }
    func chooseSquare(index: Int) {
        let isNeighborSquare = getNeighbor(location: orientationGame.startingIndex).contains(index)
        let isSquareNotThemed = orientationGame.board[index] != .theme.orientationColor
        let isSquareNotBlock = orientationGame.board[index] != .theme.blockColor
        if isNeighborSquare && isSquareNotThemed && isSquareNotBlock {
            orientationGame.board[index] = .theme.orientationColor
            orientationGame.startingIndex = index
            checkBoard()
        }
    }
    func checkBoard() {
        if orientationGame.board.allSatisfy ({ $0 == .theme.orientationColor || $0 == .theme.blockColor }) {
            alert = orientationGame.winAlert
            levelUp()
        }
    }
    func resetOrientationGame() {
        
        orientationGame.grid = [GridItem](repeating: GridItem(.flexible()), count: orientationGame.levels[orientationGameLevel].gridCount)
        
        orientationGame.board = [Color](repeating: .theme.accent, count: orientationGame.levels[orientationGameLevel].boardSize)
        
        for index in orientationGame.levels[orientationGameLevel].blocksIndice {
            orientationGame.board[index] = .theme.blockColor
        }
        
        orientationGame.startingIndex = orientationGame.levels[orientationGameLevel].start
        orientationGame.board[orientationGame.startingIndex] = .theme.orientationColor
        resetAlert()
    }
    func levelUp() {
        if orientationGameLevel < OrientationGame.levels.count { orientationGameLevel += 1 }
    }
    
    init() {
        resetMemoryGame()
        resetOrientationGame()
    }
}
