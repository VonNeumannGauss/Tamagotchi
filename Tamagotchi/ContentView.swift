//
//  ContentView.swift
//  Tamagotchi
//
//  Created by Marinov, Zachary (Coll) on 22/01/2021.
//

import SwiftUI


/*how to make tamagotchi dynamic and responsive to what's happening
 go in to the tamagotchi class and make it an "ObservableOBject"
 add @StateObject to the variable here
 add @Published to all of the variables in the class constructor file that you want to make dynamic here
*/


//THings to do:
//include an area for Tamagotchi to return dialogue


struct ContentView: View {
    //as I'll be changing properties of this e.g. happiness throughout
    @StateObject var tamagotchi = Tamagotchi()
    @State var dialogue: String = "This is where Tamagotchi will speak to you"
    
    @State private var gameResponse: String = ""
    
    @State private var isFedMeal = false
    
    let timer = Timer.publish(every: 10, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        
        
        VStack {
            VStack {
                Text(tamagotchi.displayHealthMeter())
                    .padding()
                //add the age here - this is also where the timer for random events will be linked in
                Text("Tamagotchi's age")
                    .onReceive(timer) { _ in
                        self.tamagotchi.randomEvent()
                    }
                
            }
            
            Form {
                //Button for feed meal
                Button("Feed meal", action: {
                    dialogue = tamagotchi.eatMeal()
                })
                Button("Feed snack", action: {
                    dialogue = tamagotchi.eatSnack()
                })
                
                
                //need to make the game work
                
                Button("Play game", action: {
                    var numberOfCorrectGuesses = Int()
                    for _ in 1...5 {
                       
                        var results = tamagotchi.playGameSwiftUI(numberOfCorrectGuesses: numberOfCorrectGuesses, gameResponse: gameResponse)
                        
                        dialogue = results.0
                        numberOfCorrectGuesses = results.1
                        
                        
                        //separate game dialogue + toggle button to turn on game mode or sthg like that
                    }
                    tamagotchi.incrementHappinessWhenPlayingGame(numberOfCorrectGuesses: numberOfCorrectGuesses)
                       
                    
                })
                TextField("Will Tamagotchi go left or right? Input 'L' or 'R'", text: $gameResponse)
                //need an dynamic output field + an input field
                Text("Your response: \(gameResponse)")
                
            }
            Text("\(dialogue)")
                .baselineOffset(20.0)
            
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
