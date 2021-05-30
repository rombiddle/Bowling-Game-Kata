//
//  GameRequirement.swift
//  BowlingGame
//
//  Created by Romain Brunie on 30/05/2021.
//

import Foundation

protocol GameRequirement {
    func roll(_ pin: Int)
    func score() -> Int
}
