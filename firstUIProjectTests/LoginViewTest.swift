//
//  LoginViewTest.swift
//  firstUIProjectTests
//
//  Created by Ahmed Hamza on 2/19/25.
//
@testable import firstUIProject
import XCTest

final class LoginViewTest: XCTestCase {
    var logInViewModel: LogInViewModel!
    
    override func setUpWithError() throws {
        logInViewModel = LogInViewModel()
    }

    override func tearDownWithError() throws {
        logInViewModel = nil
    }

    func testExample() throws {
    }

    func testValidateLoginEmail_CorrectEmailFormat_ShouldReturnTrue() throws{
        // given
        let expectations = expectation(description: "When email is correct, it should return correct")
        let emailToValidate = "ahmed@gmail.com"
        
        let isValidEmailFormat = logInViewModel.validEmail(emailToValidate)
        XCTAssertTrue(isValidEmailFormat)
        expectations.fulfill()
        wait(for: [expectations])
    }
    func testValidateLoginEmail_IncorrectEmailFormat_ShouldReturnFalse() throws{
        // given
        let expectations = expectation(description: "When email is missing an '@', it should return false")
        let emailToValidate = "ahmedgmail.com"
        
        let isValidEmailFormat = logInViewModel.validEmail(emailToValidate)
        XCTAssertFalse(isValidEmailFormat)
        expectations.fulfill()
        wait(for: [expectations])
    }
    func testValidateLoginEmail_SecondIncorrectEmailFormat_ShouldReturnFalse() throws{
        // given
        let expectations = expectation(description: "When email is missing a dot, it should return false")
        let emailToValidate = "ahmed@gmailcom"
        
        let isValidEmailFormat = logInViewModel.validEmail(emailToValidate)
        XCTAssertFalse(isValidEmailFormat)
        expectations.fulfill()
        wait(for: [expectations])
    }
    func testValidateLoginPassword_EmptyPassword_ShouldReturnFalse() throws{
        // given
        let expectations = expectation(description: "When password is empty, it should return false")

        let passwordToValidate = ""
        
        let isValidPasswordFormat = logInViewModel.validPassword(passwordToValidate)
        XCTAssertFalse(isValidPasswordFormat)
        expectations.fulfill()
        wait(for: [expectations])
    }
    func testValidateLoginPassword_ShortPassword_ShouldReturnFalse() throws{
        // given
        let expectations = expectation(description: "When shortPass, it should return false")

        let passwordToValidate = "123"
        
        let isValidPasswordFormat = logInViewModel.validPassword(passwordToValidate)
        XCTAssertFalse(isValidPasswordFormat)
        expectations.fulfill()
        wait(for: [expectations])
    }
    func testValidateLoginPassword_LongPassword_ShouldReturnTrue() throws{
        // given
        let expectations = expectation(description: "When valid password is entered, it should return true")
        let passwordToValidate = "123456789"
        
        let isValidPasswordFormat = logInViewModel.validPassword(passwordToValidate)
        XCTAssertTrue(isValidPasswordFormat)
        expectations.fulfill()
        wait(for: [expectations])
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
