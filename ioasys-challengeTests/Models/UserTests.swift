//
//  UserTests.swift
//  ioasys-challengeTests
//
//  Created by Gabriel on 17/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import XCTest
@testable import ioasys_challenge

class UserTests: XCTestCase {
    
    override func setUp() {}

    override func tearDown() {}
    
    func testSucessfulInit() {
        let jsonObjectString = """
        {\"investor\":{\"id\":1,\"investor_name\":\"Teste Apple\",\"email\":\"testeapple@ioasys.com.br\",\"city\":\"BH\",\"country\":\"Brasil\",\"balance\":350000.0,\"photo\":\"/uploads/investor/photo/1/cropped4991818370070749122.jpg\",\"portfolio\":{\"enterprises_number\":0,\"enterprises\":[]},\"portfolio_value\":350000.0,\"first_access\":false,\"super_angel\":false},\"enterprise\":null,\"success\":true}
        """
        let json = jsonObjectString.data(using: .utf8)
        let user = try? JSONDecoder().decode(User.self, from: json!)
        XCTAssertNotNil(user, "User initialization failed")
    }
    
    func testValidEmail() {
        let email = "testeapple@ioasys.com.br"
        let response = User.validate(email: email)
        XCTAssert(response.result, "Email validation test failed for correct example")
    }
    
    func testInvalidEmail() {
        let email = "teste"
        let respone = User.validate(email: email)
        XCTAssert(!respone.result, "Email validatin test failed for incorrect example")
    }
    
    func testInvalidPassword() {
        let password = "123"
        let response = User.validate(password: password)
        XCTAssert(!response.result, "Password validatin test failed for incorrect example")
    }

    func testValidPassword() {
        let password = "1234"
        let response = User.validate(password: password)
        XCTAssert(response.result, "Password validatin test failed for correct example")
    }



}
