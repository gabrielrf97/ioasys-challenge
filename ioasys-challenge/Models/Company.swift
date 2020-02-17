//
//  Company.swift
//  ioasys-challenge
//
//  Created by Gabriel on 14/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation
import UIKit

class Company: Decodable {
//    let name: String
    let id: Int
//    let description: String?
//    let city: String?
//    let country: String?
//    let photoUrl: String?
//    let typeName: String
//    let typeId: Int
    
    required init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
               let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .companies)
               id = try response.decode(Int.self, forKey: .id)
//               name = try response.decode(String.self, forKey: .name)
       //        description = try companies.decode(String.self, forKey: .description)
       //        photoUrl = try companies.decode(String.self, forKey: .photoUrl)
       //        city = try companies.decode(String.self, forKey: .city)
       //        country = try companies.decode(String.self, forKey: .country)
       //        let type = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .type)
       //        typeName = try type.decode(String.self, forKey: .typeName)
       //        typeId = try type.decode(Int.self, forKey: .id)
    }
    
    private enum CodingKeys: String, CodingKey {
//        case name = "enterprise_name"
        case id = "id"
//        case description = "description"
//        case city = "city"
//        case country = "country"
//        case photoUrl = "photo"
//        case type = "enterprise_type"
        case companies = "enterprises"
//        case typeName = "enterprise_type_name"
    }
}
