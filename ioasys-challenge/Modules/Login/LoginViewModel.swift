//
//  LoginViewModel.swift
//  ioasys-challenge
//
//  Created by Gabriel on 14/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation

protocol LoginViewDelegate: class {
    func performedLoginSucessfuly()
    func loginAttemptFailed(with errorMessage: String)
    func fieldValidationFailed(erros: [String])
}

class LoginViewModel {
    
    weak var viewDelegate: LoginViewDelegate?
    
    init() { // consider dependency injection for network
        
    }
    
    func tryLogin(with email: String, password: String) -> (Bool, [String]?) {
        var result = true
        var errors = [String]()
        
        let emailValidation = User.validate(email: email)
        let passwordValidation = User.validate(password: password)
        
        if emailValidation.result && passwordValidation.result {
            performLogin()
            return (true, nil)
        } else {
            if !emailValidation.result {
                guard let emailError = emailValidation.error else {
                    return (false, nil)
                }
                errors.append(emailError)
            } else {
                errors.append("")
            }
            
            if !passwordValidation.result {
                guard let passwordError = passwordValidation.error else {
                    return (false, nil)
                }
                errors.append(passwordError)
            } else {
                errors.append("")
            }
            return (false, errors)
        }
        
         
        
    }
    
    func performLogin() {
        
    }

}
