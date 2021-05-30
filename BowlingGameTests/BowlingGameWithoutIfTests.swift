//
//  BowlingGameWithoutIfTests.swift
//  BowlingGameTests
//
//  Created by Romain Brunie on 06/04/2021.
//

import XCTest
import BowlingGame

class BowlingGameWithoutIfTests: XCTestCase {

    func test_game_withAllZeros() {
        let game = GameWithoutIf()
        
        rollMany(game: game, pin: 0, times: 20)
        
        XCTAssertEqual(game.score(), 0)
    }
    
    func test_game_withAllOnes() {
        let game = GameWithoutIf()
        
        rollMany(game: game, pin: 1, times: 20)

        XCTAssertEqual(game.score(), 20)
    }
    
    func test_game_withWithOneSpare() {
        let game = GameWithoutIf()
        
        game.roll(5)
        game.roll(5)
        rollMany(game: game, pin: 1, times: 18)

        XCTAssertEqual(game.score(), 29)
    }
    
    func test_game_withWithOneStrike() {
        let game = GameWithoutIf()
        
        game.roll(10)
        rollMany(game: game, pin: 1, times: 18)

        XCTAssertEqual(game.score(), 30)
    }
    
    func test_GutterGame_scorePerfectGame() {
        let game = GameWithoutIf()

        rollMany(game: game, pin: 10, times: 12)

        XCTAssertEqual(game.score(), 300)
    }
    
    // MARK: - Helpers
    
    private func rollMany(game: GameWithoutIf, pin: Int, times: Int) {
        for _ in (1...times) {
            game.roll(pin)
        }
    }

}
