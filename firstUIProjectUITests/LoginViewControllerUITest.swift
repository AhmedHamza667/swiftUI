//
//  LoginViewControllerUITest.swift
//  firstUIProjectUITests
//
//  Created by Ahmed Hamza on 2/19/25.
//

import XCTest

final class LoginViewControllerUITest: XCTestCase {
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

    func testLoginScreenExists() throws {
        let loginLabel = app.staticTexts["signInLabelId"]
        XCTAssertTrue(loginLabel.exists)
    }
    func testInvalidLoginUI() throws {
        let emailTextField = app.textFields["emailTextFieldId"]
        let passwordTextField = app.secureTextFields["passwordTextFieldId"]
        let signInBtn = app.buttons["signInBtnId"]
        emailTextField.tap()
        emailTextField.typeText("ahmed@gmail.com")
        passwordTextField.tap()
        passwordTextField.typeText("123")
        signInBtn.tap()
        let homeScreenLabel = app.staticTexts["Home Screen"]
        XCTAssertFalse(homeScreenLabel.exists)
    }
    
    
    func testValidpassUI() throws {
        let emailTextField = app.textFields["emailTextFieldId"]
        let passwordTextField = app.secureTextFields["passwordTextFieldId"]
        let signInBtn = app.buttons["signInBtnId"]
        emailTextField.tap()
        emailTextField.typeText("ahmed@gmail.com")
        passwordTextField.tap()
        passwordTextField.typeText("123456789")
        signInBtn.tap()
        let homeScreenLabel = app.staticTexts["Home Screen"]
        XCTAssertTrue(homeScreenLabel.exists)
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
