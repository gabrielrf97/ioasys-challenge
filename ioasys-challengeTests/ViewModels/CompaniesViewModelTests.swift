//
//  CompaniesViewModelTests.swift
//  ioasys-challengeTests
//
//  Created by Gabriel on 18/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import XCTest

@testable import ioasys_challenge
class CompaniesViewModelTests: XCTestCase {

    var suv : CompaniesViewModel!
    var companies: [CompanyInfo]?
    
    override func setUp() {
        companies?.removeAll()
        let mockedServer = MockClientServer()
        suv = CompaniesViewModel(server: mockedServer)
        suv.companiesDelegate = self
    }

    override func tearDown() {}

    func testGetCompanies() {
        suv.fetchCompanies(containing: "anystring")
        XCTAssert(companies?.count != 0, "Test failed in getting mocked data")
    }
    
    func testCasting() {
        let company = Company.mocked()
        suv.castModelToViewType(enterprises: [company])
        guard let companyInfo = suv.companiesInfo.first else {
            XCTFail()
            return
        }
        XCTAssert(companyInfo.id == company.id, "CompanyInfo should have a different id")
        XCTAssert(companyInfo.name == company.name, "CompanyInfo should have a different name")
        XCTAssert(companyInfo.description == company.description, "CompanyInfo should have a different description")
        if let photoUrl = company.photoUrl {
            XCTAssert(companyInfo.pictureUrl == "\(Router.emptyUrl)\(photoUrl)", "CompanyInfo should have a different photoUrl")
        } else {
            XCTAssert(companyInfo.pictureUrl == "\(Router.emptyUrl)", "CompanyInfo should have a different photoUrl")
        }
        if let location = companyInfo.location, let city = company.city?.capitalized, let country = company.country?.capitalized {
             XCTAssert( location == "\(city), \(country)", "CompanyInfo should have a different location")
        }
        XCTAssert(companyInfo.type == company.type.name, "CompanyInfo should have a different type name")
    }

}

extension CompaniesViewModelTests: CompaniesViewDelegate {
    func updateView(companies: [CompanyInfo]) {
        self.companies = companies
    }
}
