//
//  ClientServer.swift
//  ioasys-challenge
//
//  Created by Gabriel on 18/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation

protocol ClientServer {
    func login(email: String, password: String, completion: @escaping (NetworkLayerResult<User>) -> Void)
    func requestCompanies(with name: String, completion: @escaping (NetworkLayerResult<[Company]>) -> Void)
}

struct AppClientServer: ClientServer {
    func login(email: String, password: String, completion: @escaping (NetworkLayerResult<User>) -> Void) {
        Network.shared.request(.login, model: User.self, completion: { response in
            let params : [String:Any] = ["email":email,
                          "password":password]
            
            Network.shared.request(.login, parameters: params, model: User.self, completion: { response in
                switch response {
                case .success(let response):
                    AppAuth.shared.signin(email: email, password: password, client: response.client, token: response.token)
                    completion(.success(model: response.model))
                case .failure(let error):
                    completion(.failure(error: error))
                }
            })
        })
    }
    
    func requestCompanies(with name: String, completion: @escaping (NetworkLayerResult<[Company]>) -> Void) {
        let params : Parameters = ["name": name]
        Network.shared.request(.getCompanies, parameters: params, model: Companies.self, completion: { response in
            switch response {
            case .success(let response):
                guard let enterprises = response.model?.enterprises else {
                    return
                }
                completion(.success(model: enterprises))
            case .failure(let error):
                completion(.failure(error: error))
            }
        })
    }
}

struct MockClientServer: ClientServer {
    func login(email: String, password: String, completion: @escaping (NetworkLayerResult<User>) -> Void) {
        if email == "testeapple@ioasys.com.br" && password == "12341234" {
            let user = User.getMocked()
            completion(.success(model: user))
        }
        completion(.failure(error: "Invalid credentials"))
    }
    
    func requestCompanies(with name: String, completion: @escaping (NetworkLayerResult<[Company]>) -> Void) {
        let companies = Company.getMocked(count: 5)
        completion(.success(model: companies))
    }
}
