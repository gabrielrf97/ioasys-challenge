//
//  Enterprise.swift
//  ioasys-challenge
//
//  Created by Gabriel on 17/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation

class Entreprises: Decodable {
    let enterprises: [Enterprise]
}

class Enterprise: Decodable {
    
    let name: String
    let id: Int
    let description: String
    let city: String?
    let country: String?
    let photoUrl: String?
//    let typeName: String
//    let typeId: Int
    
//    required init(from decoder: Decoder) throws {
//       let response = try decoder.container(keyedBy: CodingKeys.self)
//       id = try response.decode(Int.self, forKey: .id)
//       name = try response.decode(String.self, forKey: .name)
//       description = try response.decode(String.self, forKey: .description)
//       photoUrl = try response.decode(String.self, forKey: .photoUrl)
//       city = try response.decode(String.self, forKey: .city)
//       country = try response.decode(String.self, forKey: .country)
//       let type = try response.nestedContainer(keyedBy: CodingKeys.self, forKey: .type)
//       typeName = try type.decode(String.self, forKey: .typeName)
//       typeId = try type.decode(Int.self, forKey: .id)
//    }
    
    private enum CodingKeys: String, CodingKey {
            case name = "enterprise_name"
            case id = "id"
            case description = "description"
            case city = "city"
            case country = "country"
            case photoUrl = "photo"
//            case type = "enterprise_type"
//            case companies = "enterprises"
//            case typeName = "enterprise_type_name"
        }
}
