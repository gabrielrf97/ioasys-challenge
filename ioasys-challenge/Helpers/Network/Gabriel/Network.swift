//
//  Network.swift
//  ODMiOS
//
//  Created by Gabriel on 26/02/19.
//  Copyright © 2019 gabrielrodrigues. All rights reserved.
//

import Foundation
import Alamofire
//import AlamofireImage

typealias Parameters = [String : Any]

enum NetworkResult<Model> {
    case sucess (model: Model?)
    case failure (error: String)
}

class Network {
    
    static let shared = Network()
    
    private init() {}
    
    func request<Model:Decodable>(_ router: Router, parameters: Parameters? = nil, model: Model.Type, completion: @escaping (NetworkResult<Model>) -> Void) {
        
        URLCache.shared.removeAllCachedResponses()
        
        Alamofire.request(router.url, method: router.method , parameters: parameters, headers: router.headers)
            .validate()
            .response { response in
                
            do {
                
                var object: Model?
                
                if let error = response.error as NSError? {
                    
                    switch error.code {
                    case -1009:
                        completion(.failure(error: "No internet connection"))
                    case -1004:
                        completion(.failure(error: "We could not connect to the server"))
                    default:
                        completion(.failure(error: "\(String(data: response.data!, encoding: .utf8))"))
                    }
                    
                    return
                }
                
                if response.data?.count != 0 {
                    object = try JSONDecoder().decode(model, from: response.data!)
                }
                
                completion(.sucess(model: object))
                
            } catch {
                completion(.failure(error: "Sorry, something went wrong"))
            }
        }
    }
}
