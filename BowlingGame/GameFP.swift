//
//  GameFP.swift
//  BowlingGame
//
//  Created by Romain Brunie on 30/05/2021.
//

import Foundation

public final class GameFP: GameRequirement {
    private var rolls = [Int]()
    private static var LAST_FRAME: Int { return 10 }
    
    public init() {}

    public func roll(_ pin: Int) {
        rolls.append(pin)
    }
    
    public func score() -> Int {
        (1...10).enumerated().reduce(0) { (totalScore, frame) -> Int in
            if isStrike(for: frame.offset) {
                print("🎳 STRIKE +\(10 + strikeBonus(for: frame.offset))")
                return totalScore + 10 + strikeBonus(for: frame.offset)
            } else if isSpare(for: frame.offset) {
                print("🎳 SPARE +\(10 + spareBonus(for: frame.offset))")
                return totalScore + 10 + spareBonus(for: frame.offset)
            } else {
                print("🎳 +\(frameScore(for: frame.offset))")
                return totalScore + frameScore(for: frame.offset)
            }
        }
    }
    
    // MARK: Spare
    
    private func isSpare(for frame: Int) -> Bool {
        rolls
            .enumerated()
            .filter { rollsForFrame(frame).contains($0.offset) }
            .reduce(0) { $0 + $1.element } == 10
    }
    
    private func spareBonus(for frame: Int) -> Int {
        rolls[rollsForFrame(frame + 1).first ?? 0]
    }
    
    // MARK: Strike
    
    private func isStrike(for frame: Int) -> Bool {
        rolls
            .enumerated()
            .filter { rollsForFrame(frame).first == $0.offset }
            .reduce(0) { $0 + $1.element } == 10
    }
    
    private func strikeBonus(for frame: Int) -> Int {
        if frame == GameFP.LAST_FRAME {
            return (rolls[rollsForFrame(frame + 1).first ?? 0]
                        + ((rollsForFrame(frame + 1).count > 1)
                            ? rolls[rollsForFrame(frame).last ?? 0]
                            : rolls[rollsForFrame(frame + 1).first ?? 0]))
        } else {
            return (rolls[rollsForFrame(frame + 1).first ?? 0]
                        + ((rollsForFrame(frame + 1).count > 1)
                            ? rolls[rollsForFrame(frame + 1).last ?? 0]
                            : rolls[rollsForFrame(frame + 2).first ?? 0]))
        }
    }
    
    // MARK: Frame
    
    private func frameScore(for frame: Int) -> Int {
        rolls[rollsForFrame(frame)[0]] + rolls[rollsForFrame(frame)[1]]
    }
    
    private func rollsForFrame(_ targetframe: Int) -> [Int] {
        rolls.enumerated().compactMap { roll -> [Int]? in
            if rolls[roll.offset] == 10 {
                return [roll.offset]
            } else {
                return [roll.offset, roll.offset + 1]
            }
        }.reduce([]) { (frames, currentFrame) -> [[Int]] in
            if frames.contains(where: { $0.first == currentFrame.first || $0.last == currentFrame.first  }) {
                return frames
            } else {
                return frames + [currentFrame]
            }
        }[targetframe]
    }
}
