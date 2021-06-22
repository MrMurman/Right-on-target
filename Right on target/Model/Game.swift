//
//  Game.swift
//  Right on target
//
//  Created by Андрей Бородкин on 22.06.2021.
//

import Foundation

protocol GameProtocol{
    // Number of points earned
    var score: Int {get}
    
    // Mystery number
    var currentSecretValue: Int {get}
    
    //Checks if game has ended
    var isGameEnded: Bool {get}
    
    // Starts a new game and round
    func restartGame()
    
    // Starts a new round (new mystery number is generated)
    func startNewRound()
    
    // Checks a passed value with the mystry number and assigns poits accordingly
    func calculateScore(with value: Int)
}


class Game: GameProtocol {
    
    var score: Int = 0
    // Minimal mystery number
    private var minSecretValue: Int
    
    //Maximum mystery number
    private var maxSecretValue: Int
    var currentSecretValue: Int = 0
    
    // Numeber of rounds
    private var lastRound: Int
    private var currentRound: Int = 1
    
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        // Starting value wished for cannot be larger than the end value
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    // Wish for the mystery number
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    // Counts points
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
