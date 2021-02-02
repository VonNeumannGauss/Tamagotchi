//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Marinov, Zachary (Coll) on 22/01/2021.
//

import Foundation

class Tamagotchi: ObservableObject {
    
    @Published var age: Int = 0
    var weight: Int = 5 {
        didSet {
            if weight > 99 {
                weight = 99
            } else if weight < 0 {
                weight = 0
            }
        }
    }
    @Published var discipline: Int
    @Published var hunger: Int {
        didSet {
            if hunger > 5 {
                hunger = 5
            } else if hunger < 0 {
                hunger = 0
            }
        }
    }
    @Published var happiness: Int {
        didSet {
            if happiness > 5 {
                happiness = 5
            } else if happiness < 0 {
                happiness = 0
            }
        }
    }
    var isSick: Bool
    var isSleeping: Bool
    var needsAttention: Bool
    var areThereDroppings: Bool
    
    init() {
        age = 0
        weight = 5
        discipline = 0
        hunger = 5
        happiness = 0
        isSick = false
        isSleeping = false
        needsAttention = true
        areThereDroppings = false
    }
    
    func displayHealthMeter() -> String {
        return "Happiness: \(String(repeating: "\u{2665}", count:happiness)) \nHunger: \(String(repeating: "\u{1F374}", count:hunger)) \nDiscipline: \(String(repeating: "\u{1F4AA}", count:discipline)) \nAge: \(age)"
    }
    
    func increaseAge() {
        age += 5
    }
    
    func eatSnack() -> String {
        hunger -= 1
        happiness += 1
        weight += 2
        return "Yummy!"
    }
    
    func eatMeal() -> String {
        hunger -= 2
        happiness += 2
        weight += 4
        return "Hmmmmmmmmmmm"
    }
    
    func wakeUp() {
        isSleeping = false
        print("I'm awake! ")
    }
    
    func sleep() {
        isSleeping = true
        print("I'm sleeping now")
    }
    
    //normal playgame - modified for app display so don't use 
    func playGame() {
        let game = Game()
        var numberOfCorrectGuesses = Int()
        for _ in 1...5 {
            var personDirection = Bool()
            print("Will Tamagotchi go left or right? Input 'L' or 'R'")
            if let choice = readLine() {
                if choice == "L" {
                    personDirection = false
                } else {
                    personDirection = true
                }
            }
            numberOfCorrectGuesses += game.playGame(personDirection: personDirection)
        }
        
         happiness += numberOfCorrectGuesses / 2
        
    }
    
    //for swiftUI
    func playGameSwiftUI(gameResponse: String) -> String {

        var dialogue: String
        var personDirection = Bool()
        //TextField("Will Tamagotchi go left or right? Input 'L' or 'R'", text: $gameResponse)
            //.disableAutocorrection(true)
        if gameResponse == "L" {
            personDirection = false
            dialogue = "You chose left!"
        } else {
            personDirection = true
            dialogue = "You chose right!"
        }
        
        let tamagotchiDirection = Bool.random()
        if personDirection == tamagotchiDirection {
            dialogue = "Good job! You guessed the right direction!"
            happiness += 1
        } else {
            dialogue = "You guessed wrong"
        }
        
        return dialogue
    }
    
    func takeMedicine() {
        isSick = Bool.random()
        if isSick {
            print("Tamagotchi is still sick! Keep giving medicine!")
        } else {
            print("Tamagotchi is feeling better now")
        }
    }
    
    func goToToilet() {
        areThereDroppings = false
        happiness += 2
    }
    
    func beDisciplined() {
        discipline += 1
        print("You disciplined Tamagotchi.")
    }
    
    func beCleanedUpAfter() {
        areThereDroppings = false
        print("Thanks for cleaning! I feel much better now.")
    }
    
    func randomEvent() {
        let whatHappens = Int.random(in: 1...5)
        /*
        switch whatHappens {
        case 1:
            //isSick = true
        }
         */
    }
    
}

