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
    @Published var discipline: Int {
        didSet {
            if discipline > 5 {
                discipline = 5
            } else if discipline < 0 {
                discipline = 0
            }
        }
    }
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
    //death = 1 means it's dead, otherwise it's alive. I know it's not ideal, but I wanted to make it a less than 50% chance that it would be dead
    var death: Int
    
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
        death = 0
    }
    
    func displayHealthMeter() -> String {
        return "Happiness: \(String(repeating: "\u{2665}", count:happiness)) \nHunger: \(String(repeating: "\u{1F374}", count:hunger)) \nDiscipline: \(String(repeating: "\u{1F4AA}", count:discipline)) \nAge: \(age) \nHealth: \(!isSick ? "Healthy" : "Unhealthy") \nHygiene: \(!areThereDroppings ? "Clean" : "Needs cleaning")"
    }
    //tamagotchis live to around 23 years at best = 230 seconds
    //make it so that it ages more if things aren't being done i.e. ages faster or more likely to die of health stats are low - this is in place
    //display warning messages? - not necessary if the  health bar displays this
    func increaseAge() {
        age += 1
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
    
    func takeMedicine() -> String {
        isSick = Bool.random()
        if isSick {
            return "Tamagotchi is still sick! Keep giving medicine!"
        } else {
            return "Tamagotchi is feeling better now"
        }
    }
    
    func beDisciplined() {
        discipline += 1
        print("You disciplined Tamagotchi.")
    }
    
    func beCleanedUpAfter() -> String {
        areThereDroppings = false
        happiness += 1
        return "Thanks for cleaning! I feel much better now."
    }
    
    func randomEvent() {
        let whatHappens = Int.random(in: 1...6)
        
        switch whatHappens {
        case 1:
            //gets sick
            isSick = true
        case 2:
            //needs bathroom
            areThereDroppings = true
        case 3:
            discipline -= 1
        case 4:
            hunger += 1
        default:
            happiness -= 1
            
        }
        
        if (age >= 10) || (hunger >= 2) || (happiness <= 2) || (areThereDroppings) || (isSick) {
            death = Int.random(in: 1...3)
            //what happens will be delegated to contentView
        }
        
    }
    
    func isDead() -> Bool {
        
        return (death == 1)
        
    }
    
}

