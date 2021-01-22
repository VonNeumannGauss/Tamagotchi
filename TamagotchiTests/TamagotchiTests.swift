//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Marinov, Zachary (Coll) on 22/01/2021.
//

import XCTest

class TamagotchiTests: XCTestCase {

    func testDoesHealthMeterWork() {
        //arrange
        //act
        let tamagotchi = Tamagotchi()
        XCTAssertEqual("Happiness: \(String(repeating: "\u{2665}", count:0)) \nHunger: \(String(repeating: "\u{1F374}", count:5)) \nDiscipline: \(String(repeating: "\u{1F4AA}", count:0))",tamagotchi.displayHealthMeter())
    }

}
