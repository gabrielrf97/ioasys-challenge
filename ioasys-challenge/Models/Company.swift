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
    
    init(id: Int, name: String, description: String, city: String?, country: String?, photoUrl: String?, type: CompanyType) {
        self.id = id
        self.name = name
        self.description = description
        self.city = city
        self.country = country
        self.photoUrl = photoUrl
        self.type = type
    }
    
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

//MARK: - Extesion used to mock company data
extension Company {
    static func getMocked(count: Int) -> [Company] {
        var companies = [Company]()
        for _ in 0..<count {
            companies.append(Company.mocked())
        }
        return companies
    }
    
    static func mocked() -> Company {
        let company = Company(id: 1, name: "Mocked Name", description: "Mocked Description", city: "M city", country: "M country", photoUrl: nil, type: CompanyType(name: "Mocked Type", id: 1))
        return company
    }
}
