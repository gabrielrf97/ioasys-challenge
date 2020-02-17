//
//  Enterprise.swift
//  ioasys-challenge
//
//  Created by Gabriel on 17/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation

class Companies: Decodable {
    let enterprises: [Company]
}

struct CompanyType: Decodable {
    let name: String
    let id: Int
    
    private enum CodingKeys: String, CodingKey {
        case name = "enterprise_type_name"
        case id = "id"
    }
}

class Company: Decodable {
    
    let name: String
    let id: Int
    let description: String
    let city: String?
    let country: String?
    let photoUrl: String?
    let type: CompanyType
    
    private enum CodingKeys: String, CodingKey {
        case name = "enterprise_name"
        case id = "id"
        case description = "description"
        case city = "city"
        case country = "country"
        case photoUrl = "photo"
        case type = "enterprise_type"
    }
}
