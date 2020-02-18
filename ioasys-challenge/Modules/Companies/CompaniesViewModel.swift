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
    let serverDelegate: ClientServer
    
    var companiesInfo = [CompanyInfo]()
    
    
    init(server: ClientServer = AppClientServer()) {
        self.serverDelegate = server
    }
    
    func fetchCompanies(containing string: String) {
        if string.isEmpty { return }
        serverDelegate.requestCompanies(with: string, completion: { response in
            switch response {
            case .success(let companies):
                if let _companies = companies {
                    self.castModelToViewType(enterprises: _companies)
                    self.companiesDelegate?.updateView(companies: self.companiesInfo)
                }
            case .failure( _):
//TO-DO: Present error message
                break
            }
        })
    }
    
    func castModelToViewType(enterprises: [Company]) {
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
            
            let companyInfo = CompanyInfo(id: company.id, pictureUrl: "\(Router.emptyUrl)\(photoUrl)", name: company.name, location: location, type: company.type.name, description: company.description)
    
            companiesInfo.append(companyInfo)
        }
    }
}
