//
//  NetworkService.swift
//  ioasys-challenge
//
//  Created by Gabriel on 17/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation

//protocol NetworkService {
//    func login(email: String, password: String, completion: @escaping (Bool,(token: String, client: String), Error?)->())
//    func getCompanies(string: String)
//}
//
//struct UsageService: NetworkService {
//    
//    func login(email: String, password: String, completion: (Bool, (token: String, client: String), Error?) -> ()) {
//        
//    }
//    
//    func login(email: String, password: String, completion: (Bool,(token: String, client: String), Error?)) {
//        let params : [String:Any] = ["email":email,
//                      "password":password]
//        
//        Network.shared.request(.login, parameters: params, model: User.self, completion: { response in
//            switch response {
//            case .success(let response):
//                AppAuth.shared.signin(email: email, password: password, client: response.client, token: response.token)
//                completion(true, (token: response.token, client: response.client), nil)
//            case .failure(let error):
////                completion(nil, )
//            }
//        })
//    }
//    
//    func getCompanies(string: String) {
//        
//    }
//}
//
//struct MockService: NetworkService {
//    
//    func login(email: String, password: String) {
//        
//    }
//    
//    func getCompanies(string: String) {
//        
//    }
//}
