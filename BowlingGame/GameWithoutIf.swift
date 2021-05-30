//
//  GameWithoutIf.swift
//  BowlingGame
//
//  Created by Romain Brunie on 30/05/2021.
//

import Foundation

public final class GameWithoutIf: GameRequirement {
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
            let strike = isStrike(roll) ? 10 + strikeBonus(roll) : 0
            let spare = isSpare(roll) ? 10 + spareBonus(roll) : 0
            let regular = (strike == 0 && spare == 0) ? sumOfBallsInFrame(roll) : 0
            
            roll = strike == 0 ? roll + 2 : roll + 1
            score += strike + spare + regular
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
