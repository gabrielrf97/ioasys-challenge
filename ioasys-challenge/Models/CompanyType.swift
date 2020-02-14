//
//  CompanyType.swift
//  ioasys-challenge
//
//  Created by Gabriel on 14/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation

enum CompanyType: Int, Decodable {
    case agro = 1
    case aviation = 2
    case biotech = 3
    case eco = 4
    case ecommerce = 5
    case education = 6
    case fashion = 7
    case fintech = 8
    case food = 9
    case games = 10
    case health = 11
    case iot = 12
    case logistics = 13
    case media = 14
    case mining = 15
    case products = 16
    case realEstate = 17
    case service = 18
    case smartCity = 19
    case social = 20
    case software = 21
    case technology = 22
    case tourism = 23
    case transport = 24

    func getType() -> Int {
        return self.rawValue
    }
}
