//
//  Game.swift
//  Tamagotchi
//
//  Created by Marinov, Zachary (Coll) on 22/01/2021.
//

import Foundation

class Game {
    
    
    init() {
        
    }
    
    func playGame(personDirection: Bool) -> Int {
        var numberOfCorrectGuesses = Int()
        //true = Right, false = Left
        let tamagotchiDirection = Bool.random()
        if personDirection == tamagotchiDirection {
            print("Good job! You guessed the right direction!")
            numberOfCorrectGuesses += 1
        } else {
            print("You guessed wrong.")
        }
        return numberOfCorrectGuesses
    }
    /*
    func randomEvent() {
        let whatHappens = Int.random(in: 1...5)
        switch whatHappens {
        case 1:
            //isSick = true
        }
    }
 */
}
