//
//  BowlingGameFPTests.swift
//  BowlingGameTests
//
//  Created by Romain Brunie on 04/04/2021.
//

import XCTest
import BowlingGame

class BowlingGameFPTests: XCTestCase {

    func test_game_scoreAllZeros() {
        let game = GameFP()
        
        rollMany(game: game, pin: 0, times: 20)
        
        XCTAssertEqual(game.score(), 0)
    }
    
    func test_game_scoreAllOnes() {
        let game = GameFP()
        
        rollMany(game: game, pin: 1, times: 20)
        
        XCTAssertEqual(game.score(), 20)
    }
    
    func test_game_scoreOneSpare() {
        let game = GameFP()
        
        rollSpare(for: game)
        rollMany(game: game, pin: 1, times: 18)
        
        XCTAssertEqual(game.score(), 29)
    }
    
    func test_game_scoreOneSpareAndOneStrike() {
        let game = GameFP()
        
        rollSpare(for: game)
        game.roll(2)
        game.roll(3)
        rollStrike(for: game)
        game.roll(6)
        game.roll(3)
        rollSpare(for: game)
        game.roll(6)
        game.roll(4)
        game.roll(4)
        game.roll(3)
        rollMany(game: game, pin: 1, times: 6)
        
        XCTAssertEqual(game.score(), 88)
    }
    
    func test_game_scoreOneSrike() {
        let game = GameFP()
        
        rollStrike(for: game)
        rollMany(game: game, pin: 1, times: 18)
        
        XCTAssertEqual(game.score(), 30)
    }
    
    func test_game_scoreTwoSrikeInARow() {
        let game = GameFP()
        
        rollStrike(for: game)
        rollStrike(for: game)
        rollMany(game: game, pin: 1, times: 16)
        
        XCTAssertEqual(game.score(), 49)
    }
    
    func test_game_prefectScore() {
        let game = GameFP()

        for _ in 1...12 {
            rollStrike(for: game)
        }

        XCTAssertEqual(game.score(), 300)
    }
    
    // MARK: - Helpers
    
    private func rollMany(game: GameFP, pin: Int, times: Int ) {
        for _ in 0..<times {
            game.roll(pin)
        }
    }
    
    private func rollSpare(for game: GameFP) {
        game.roll(5)
        game.roll(5)
    }
    
    private func rollStrike(for game: GameFP) {
        game.roll(10)
    }

}
