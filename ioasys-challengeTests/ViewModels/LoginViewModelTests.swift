//
//  LoginViewModelTests.swift
//  ioasys-challengeTests
//
//  Created by Gabriel on 18/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import XCTest

@testable import ioasys_challenge
class LoginViewModelTests: XCTestCase {

    var suv: LoginViewModel!
    var success: Bool?
    var errors = [String]()
    var loginResponse: Bool?
    
    override func setUp() {
        let mockedServer = MockClientServer()
        suv = LoginViewModel(server: mockedServer)
        suv.viewDelegate = self
        success = false
        errors.removeAll()
    }

    override func tearDown() {}

    func testTryLogin() {
        let email = "testeapple@ioasys.com.br"
        let password = "12341234"
        suv.tryLogin(with: email, password: password)
        XCTAssert(loginResponse!, "Login should be successfull")
    }
    
    func testToginWithInvalidCredentials() {
        let email = "testeapple@ioasys.com.br"
        let password = "123412"
        suv.tryLogin(with: email, password: password)
        XCTAssert(!success!, "Login should be unsucessfull")
        XCTAssert(!errors.isEmpty, "There should be at least one error")
    }
    
    func testLoginWithInvalidFields() {
        let email = "testeapple"
        let password = "123"
        suv.tryLogin(with: email, password: password)
        XCTAssert(!success!, "Login should be unsucessfull")
        XCTAssert(!errors.isEmpty, "There should be at least one error")
    }
}

extension LoginViewModelTests: LoginViewDelegate {
    func performedLoginSucessfuly() {
        self.loginResponse = true
    }
    
    func loginAttemptFailed(with errorMessage: String) {
        self.success = false
        self.errors.append(errorMessage)
    }
    
    func fieldValidationFailed(errors: [String]) {
        self.success = false
        self.errors = errors
    }
}
