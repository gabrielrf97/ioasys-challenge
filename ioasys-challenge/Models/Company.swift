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
    let name: String
    let id: String
    let description: String?
    let city: String?
    let country: String?
    let photoUrl: String?
    let type: CompanyType?

    
    enum CodingKeys: String, CodingKey {
        case name = "enterprise_name"
        case id = "id"
        case description = "description"
        case city = "city"
        case country = "country"
        case photoUrl = "photo"
        case type = "enterprise_type"
    }
}
