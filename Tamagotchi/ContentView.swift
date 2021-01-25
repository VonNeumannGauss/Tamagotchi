//
//  ContentView.swift
//  Tamagotchi
//
//  Created by Marinov, Zachary (Coll) on 22/01/2021.
//

import SwiftUI

struct ContentView: View {
    let tamagotchi = Tamagotchi()
    var body: some View {
        
        VStack {
            Text(tamagotchi.displayHealthMeter())
                .padding()
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
