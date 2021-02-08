//
//  TamagotchiUITests.swift
//  TamagotchiUITests
//
//  Created by Marinov, Zachary (Coll) on 22/01/2021.
//

import XCTest

class TamagotchiUITests: XCTestCase {

    func testSeeWhatThisDoes() throws {
        //arrange
        //act
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.buttons["Play game"]/*[[".cells[\"Play game\"].buttons[\"Play game\"]",".buttons[\"Play game\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let elementsQuery = app.sheets["Do you think Tamagotchi will go left or right?"].scrollViews.otherElements
        
        //assert
        XCTAssertNoThrow(elementsQuery.buttons["Left"].tap())
        
    }
    
}
