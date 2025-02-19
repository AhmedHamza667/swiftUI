//
//  ForgetPassViewControllerUITest.swift
//  firstUIProjectUITests
//
//  Created by Ahmed Hamza on 2/19/25.
//

import XCTest

final class ForgetPassViewControllerUITest: XCTestCase {
    
    var app : XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testExample() throws {
            }
    func testForgetPassPageExistsAndBackBtn() throws {
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Forgot the password?"]/*[[".buttons[\"Forgot the password?\"].staticTexts[\"Forgot the password?\"]",".staticTexts[\"Forgot the password?\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let forgetPassLabel = app.staticTexts["Reset password"]
        XCTAssertTrue(forgetPassLabel.exists)
        app.buttons["Left"].tap()
        let homeLabel = app.staticTexts["Sign In"]
        XCTAssertTrue(homeLabel.exists)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
