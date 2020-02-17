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
    func fieldValidationFailed(errors: [String])
}

class LoginViewModel {
    
    weak var viewDelegate: LoginViewDelegate?
    
    init() {}
    
    func tryLogin(with email: String, password: String) {
        var errors = [String]()
        
        let emailValidation = User.validate(email: email)
        let passwordValidation = User.validate(password: password)
        
        if emailValidation.result && passwordValidation.result {
            performLogin(with: email, password)
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
        
        Network.shared.request(.login, parameters: params, model: User.self, completion: { response in
            switch response {
            case .success(let response):
                AppAuth.shared.signin(email: email, password: password, client: response.client, token: response.token)
                self.viewDelegate?.performedLoginSucessfuly()
            case .failure(let error):
                self.viewDelegate?.loginAttemptFailed(with: error)
            }
        })
    }
}
