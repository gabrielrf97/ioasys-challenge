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
    func startedLogin()
    func loginAttemptFailed(with errorMessage: String)
    func fieldValidationFailed(errors: [String])
}

class LoginViewModel {
    
    weak var viewDelegate: LoginViewDelegate?
    
    init() { // consider dependency injection for network
        
    }
    
    func tryLogin(with email: String, password: String) {
        var errors = [String]()
        
        let emailValidation = User.validate(email: email)
        let passwordValidation = User.validate(password: password)
        
        if emailValidation.result && passwordValidation.result {
            performLogin(with: email, password)
            viewDelegate?.startedLogin()
        } else {
            if let emailError = emailValidation.error {
                errors.append(emailError)
            } else {
                errors.append("")
            }
            
            if let passwordError = passwordValidation.error{
                errors.append(passwordError)
            } else {
                errors.append("")
            }
            viewDelegate?.fieldValidationFailed(errors: errors)
        }
        
    }
    
    func performLogin(with email: String, _ password: String) {
        
        let params : [String:Any] = ["email":email,
                      "password":password]
        
        Network.shared.request(Router.login, parameters: params, model: User.self, completion: { response in
            switch response {
            case .success:
                break
            case .failure:
                break
            }
            
        })
        
        viewDelegate?.performedLoginSucessfuly()
    }

}
