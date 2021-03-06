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
//take all of the state modifying stuff out of the body and into functions beneath
//Sir, I'm not sure if I should do this with what I have here - I only have one or two line state-modifying code under each UI section, so is it still worth removing?


struct ContentView: View {
    //as I'll be changing properties of this e.g. happiness throughout
    @StateObject var tamagotchi = Tamagotchi()
    @State var dialogue: String = "This is where Tamagotchi will speak to you"
    
    @State private var gameResponse: String = ""
    
    @State private var isFedMeal = false
    
    //alert for playing game
    @State private var showingAlert = false
    
    //isDead
    @State private var isDead = false

    
    let timer = Timer.publish(every: 5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                   
                    Text(tamagotchi.displayHealthMeter())
                        .padding()
                        .onReceive(timer) { _ in
                            self.tamagotchi.randomEvent()
                            tamagotchi.increaseAge()
                            
                            if tamagotchi.isDead() {
                                isDead = true
                                Text("Death")
                                    .alert(isPresented: $isDead) {
                                        Alert(title: Text("Game over"), message: Text("Tamagotchi died"), dismissButton: .default(Text("Ok")))
                                    }
                                }
                            
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
                    
                    
                    //makes the game work. Action Sheets are brilliant!
                    
                    Button("Play game", action: { showingAlert = true })
                        .actionSheet(isPresented: $showingAlert, content: {
                            ActionSheet(title: Text("Do you think Tamagotchi will go left or right?"), message: Text("Choose wisely..."), buttons: [.default(Text("Left"), action: {
                                gameResponse = "L"
                                playGame()
                            }),
                                .default(Text("Right"), action: {
                                    gameResponse = "R"
                                    playGame()
                                    
                            })])
                        })
                    
                    Button("Give medicine", action: {
                        dialogue = tamagotchi.takeMedicine()
                    })
                    
                    Button("Clean up", action: {
                        dialogue = tamagotchi.beCleanedUpAfter()
                    })
                    
                }
                
                Text("\(dialogue)")
                    .baselineOffset(20.0)
                
            }.navigationBarTitle("Tamagotchi")
            
        }
    }
        
    
    func playGame() {

        let results = tamagotchi.playGameSwiftUI(gameResponse: gameResponse)
            
        dialogue = results
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
