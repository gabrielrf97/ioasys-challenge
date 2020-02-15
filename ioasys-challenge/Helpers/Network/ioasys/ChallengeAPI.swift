//
//  ChallengeAPI.swift
//  ioasys-challenge
//
//  Created by Gabriel on 15/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation

class ChallengeAPI: APIRequest {

//    Por que temos esse metodo aqui?
    override init(method: API.HTTPMethod, path: String, parameters: [String : Any]?, urlParameters: [String : Any]?, cacheOption: API.CacheOption, completion: ResponseBlock<Any>?) {
        super.init(method: method, path: path, parameters: parameters, urlParameters: urlParameters, cacheOption: cacheOption, completion: completion)
    }
    
    @discardableResult
    static func loginWith(email: String, password: String, callback: ResponseBlock<User>?) -> ChallengeAPI {
        
        let request = ChallengeAPI(method: .post, path: "login", parameters: ["email": email, "password": password], urlParameters: nil, cacheOption: .networkOnly) { (response, error, cache) in
            
            if let error = error {
                print(error.responseObject ?? "nil")
            } else if let response = response as? [String: Any] {
                if response.count != 0 {
                    
                }
//                Make decoding logic here
//                let user = User(dictionary: response)
//                callback?(user, nil, cache)
            }
        }
        request.shouldSaveInCache = false
        request.perform()
        return request
    }
}
