//
//  User.swift
//  ioasys-challenge
//
//  Created by Gabriel on 14/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation

class User {
    
    let id: Int
    let email: String
    let password: String
    let name: String
    
    init(id: Int, email: String, password: String, name: String) {
        self.id = id
        self.email = email
        self.password = password
        self.name = password
    }
    
    static func validate(email: String) -> (result: Bool, error: String?) {
        
        var sucess = true
        var errorMessage: String?
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                sucess = false
                errorMessage = "Be sure to inform a correct email address!"
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            errorMessage = "Be sure to inform a correct email address!"
            sucess = false
        }
        
        return (sucess, errorMessage)
    }

    static func validate(password: String) -> (result: Bool, error: String?) {
        var sucess = true
        var errorMessage : String?
        
        if password.count < 4 {
            sucess = false
            errorMessage = "Your password is too short!"
        }
        
        return (sucess, errorMessage)
    }
}
