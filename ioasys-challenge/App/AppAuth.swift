//
//  AppAuth.swift
//  ioasys-challenge
//
//  Created by Gabriel on 15/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation

enum AuthKeys: String {
    case email = "email"
    case password = "password"
    case id = "id"
    case name = "name"
    case token = "token"
    case client = "client"
    case auth = "auth"
}

class AuthModel: NSCoding{
    
    var user: User
    var client: String
    var token: String
    var uid: String {
        return self.user.email
    }
    
    init(user: User, client: String, token: String) {
        self.user = user
        self.client = client
        self.token = token
    }
    
    required convenience init?(coder: NSCoder) {
        let email = coder.decodeObject(forKey: AuthKeys.email.rawValue) as! String
        let password = coder.decodeObject(forKey: AuthKeys.password.rawValue) as! String
        let id = coder.decodeInteger(forKey: AuthKeys.id.rawValue)
        let name = coder.decodeObject(forKey: AuthKeys.name.rawValue) as! String
        let token = coder.decodeObject(forKey: AuthKeys.token.rawValue) as! String
        let client = coder.decodeObject(forKey: AuthKeys.client.rawValue) as! String
        
        let user = User(id: id, email: email, password: password, name: name)
        self.init(user: user, client: client, token: token)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(user.email, forKey: AuthKeys.email.rawValue)
        coder.encode(user.password, forKey: AuthKeys.password.rawValue)
        coder.encode(user.id, forKey: AuthKeys.id.rawValue)
        coder.encode(user.name, forKey: AuthKeys.name.rawValue)
        coder.encode(client, forKey: AuthKeys.client.rawValue)
        coder.encode(token, forKey: AuthKeys.token.rawValue)
    }
    
}

class AppAuth {
    
    var auth : AuthModel?
    
    static let shared = AppAuth()
    
    init() {
        loadAuth()
    }
    
    func loadAuth() {

        if let decodedAuth = UserDefaults.standard.object(forKey: AuthKeys.auth.rawValue) as? Data {
            do {
                let auth = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [AuthModel.self], from: decodedAuth) as! AuthModel
                self.auth = auth
            } catch {
                return
            }
        }
    }
    
    func update(user: User, client: String, token: String) {
        self.signin(user: user, client: client, token: token)
    }
    
    func signin(user: User, client: String, token: String) {
        let auth = AuthModel(user: user, client: client, token: token)
        self.auth = auth
        let archievedAuth = try? NSKeyedArchiver.archivedData(withRootObject: auth, requiringSecureCoding: true)
        UserDefaults.standard.setValue(archievedAuth, forKey: AuthKeys.auth.rawValue)
    }
    
    func logout() {
        self.auth = nil
        UserDefaults.standard.removeObject(forKey: AuthKeys.auth.rawValue)
    }
}
