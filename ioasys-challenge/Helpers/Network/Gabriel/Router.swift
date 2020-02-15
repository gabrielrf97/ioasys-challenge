//
//  Router.swift
//  ODMiOS
//
//  Created by Gabriel on 26/02/19.
//  Copyright © 2019 gabrielrodrigues. All rights reserved.
//

import Foundation
import Alamofire

enum Router {
    
    case login
    case getCompany
    
    static var domain = "https://empresas.ioasys.com.br/api"
    
    static var version = "/v1"
    
    var url: String {
        return "\(Router.domain)\(Router.version)\(self.path)"
    }
    
    var path: String {
        switch self {
        case .login: return "/users/auth/sign_in"
        case .getCompany: return "/enterprises"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .login: return .post
            case .getCompany: return .get
        }
    }
    
    var headers: HTTPHeaders? {
        guard let token = AppAuth.shared.auth?.token,
            let uid = AppAuth.shared.auth?.user.email,
            let client = AppAuth.shared.auth?.client
            else {
            return [:]
        }
        return ["token": "\(token)",
                "uid":"\(uid)",
                "client":"\(client)"]
    }
}



