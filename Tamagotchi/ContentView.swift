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
    
    
    
    @State private var isFedMeal = false
    
    var body: some View {
        
        
        VStack {
            Text(tamagotchi.displayHealthMeter())
                .padding()
            Form {
                //Button for feed meal
                Button("Feed meal", action: {
                    tamagotchi.eatMeal()
                })
                
            }
            
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
