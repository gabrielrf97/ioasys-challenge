//
//  CompaniesViewModel.swift
//  ioasys-challenge
//
//  Created by Gabriel on 14/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

protocol CompaniesViewDelegate: class {
    func updateView(companies: [CompanyInfo])
}

struct CompanyInfo {
    let id: Int
    var pictureUrl: String?
    let name: String
    let location: String?
    let type: String
    let description: String
}

class CompaniesViewModel {
    
    weak var companiesDelegate: CompaniesViewDelegate?
    var companiesInfo = [CompanyInfo]()
    
    init() {}
    
    func fetchCompanies(containing string: String) {
        
        let params : Parameters = ["name": string]
        Network.shared.request(Router.getCompany, parameters: params, model: Entreprises.self, completion: { response in
            switch response {
            case .success(let response):
                guard let enterprises = response.model?.enterprises else {
                    return
                }
                self.castModelToViewType(enterprises: enterprises)
                self.companiesDelegate?.updateView(companies: self.companiesInfo)
                break
            case .failure(let error):
                break
            }
        })
    }
    
    func castModelToViewType(enterprises: [Enterprise]) {
        companiesInfo.removeAll()
        
        for company in enterprises {
            var location : String = ""
            
            var photoUrl : String = ""
            if let _photoUrl = company.photoUrl {
                photoUrl = _photoUrl
            }
            
            if let city = company.city {
                location.append("\(city.capitalized), ")
            }
            if let country = company.country {
                location.append(country.capitalized)
            }
            
            var companyInfo = CompanyInfo(id: company.id, pictureUrl: "\(Router.emptyUrl)\(photoUrl)" ?? nil, name: company.name, location: location, type: "", description: company.description)
    
            companiesInfo.append(companyInfo)
        }
    }
}
