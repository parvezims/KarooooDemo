//
//  LoginViewModelTest.swift
//  KarooooDemoTests
//
//  Created by Muzaffar on 05/01/23.
//

import XCTest
@testable import KarooooDemo


final class LoginViewModelTest: XCTestCase {

    let user = Login(username: "parvez.ims@gmail.com", password: "12345678", country: "India")
    let loginViewModel = LoginViewModel()

    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_ValidateSignup() {
        
        let status = loginViewModel.signup(signup: user)
        XCTAssertTrue(status)
    }
    
    func test_ValidateUserLogin() {
        
        let status = loginViewModel.validateUserLogin(login: user)
        XCTAssertTrue(status)
    }
    
    func test_ValidateEmail() {
        
        let status = loginViewModel.checkForEmail(email: user.username)
        XCTAssertTrue(status)
        let wrongstatus = loginViewModel.checkForEmail(email: "qwerty.c@a")
        XCTAssertFalse(wrongstatus)
    }
    
    func test_ValidatePassword() {
        
        let status = loginViewModel.checkForPassword(password: user.password)
        XCTAssertTrue(status)
        let wrongstatus = loginViewModel.checkForPassword(password: "123456")
        XCTAssertFalse(wrongstatus)
    }
    
    func test_ValidateCountry() {
        
        let status = loginViewModel.checkForCountry(country: user.country)
        XCTAssertTrue(status)
        let wrongstatus = loginViewModel.checkForCountry(country: nil)
        XCTAssertFalse(wrongstatus)
    }
}
