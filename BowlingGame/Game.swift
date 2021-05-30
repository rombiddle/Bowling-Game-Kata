//
//  Game.swift
//  BowlingGame
//
//  Created by Romain Brunie on 30/05/2021.
//

import Foundation

public final class Game: GameRequirement {
    private var rolls = [Int](repeating: 0, count: 21)
    private var currentRoll = 0
    
    public init() {}
    
    public func roll(_ pin: Int) {
        rolls[currentRoll] = pin
        currentRoll += 1
    }
    
    public func score() -> Int {
        var score = 0
        var roll = 0
        for _ in 0..<10 {
            if isStrike(roll) {
                print("🎳 STRIKE +\(10 + strikeBonus(roll))")
                score += 10 + strikeBonus(roll)
                roll += 1
            } else if isSpare(roll) {
                print("🎳 STRIKE +\(10 + spareBonus(roll))")
                score += 10 + spareBonus(roll)
                roll += 2
            } else {
                print("🎳 +\(sumOfBallsInFrame(roll))")
                score += sumOfBallsInFrame(roll)
                roll += 2
            }
        }
        return score
    }
    
    private func isStrike(_ roll: Int) -> Bool {
        return rolls[roll] == 10
    }
    
    private func isSpare(_ roll: Int) -> Bool {
        return (rolls[roll] + rolls[roll + 1]) == 10
    }
    
    private func strikeBonus(_ roll: Int) -> Int {
        return rolls[roll + 1] + rolls[roll + 2]
    }
    
    private func spareBonus(_ roll: Int) -> Int {
        return rolls[roll + 2]
    }
    
    private func sumOfBallsInFrame(_ roll: Int) -> Int {
        return rolls[roll] + rolls[roll + 1]
    }
}
