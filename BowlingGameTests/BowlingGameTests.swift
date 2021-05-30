//
//  BowlingGameTests.swift
//  BowlingGameTests
//
//  Created by Romain Brunie on 01/04/2021.
//

import XCTest
import BowlingGame

class BowlingGameTests: XCTestCase {

    func test_GutterGame_scoreZero() {
        let game = Game()
        
        playGame(game: game, pins: 0, times: 20)
        
        XCTAssertEqual(game.score(), 0)
    }
    
    func test_GutterGame_scoreTwenty() {
        let game = Game()
        
        playGame(game: game, pins: 1, times: 20)

        XCTAssertEqual(game.score(), 20)
    }
    
    func test_GutterGame_scoreSpareWithOnes() {
        let game = Game()

        game.roll(5)
        game.roll(5)
        game.roll(3)
        playGame(game: game, pins: 0, times: 17)

        XCTAssertEqual(game.score(), 16)
    }
    
    func test_game_scoreOneSpareAndOneStrike() {
        let game = Game()
        
        game.roll(5)
        game.roll(5)
        game.roll(2)
        game.roll(3)
        game.roll(10)
        game.roll(6)
        game.roll(3)
        game.roll(5)
        game.roll(5)
        game.roll(6)
        game.roll(4)
        game.roll(4)
        game.roll(3)
        playGame(game: game, pins: 1, times: 6)
        
        XCTAssertEqual(game.score(), 88)
    }
    
    func test_GutterGame_scoreStrikeWithOnes() {
        let game = Game()

        game.roll(10)
        playGame(game: game, pins: 1, times: 18)

        XCTAssertEqual(game.score(), 30)
    }
    
    func testOneStrike() {
        let game = Game()
        
        game.roll(10)
        game.roll(3)
        game.roll(4)
        playGame(game: game, pins: 0, times: 16)
        
        XCTAssertEqual(game.score(), 24)
    }
    
    func test_GutterGame_scorePerfectGame() {
        let game = Game()

        playGame(game: game, pins: 10, times: 12)

        XCTAssertEqual(game.score(), 300)
    }

    // Helpers
    
    private func playGame(game: Game, pins: Int, times: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }

}
