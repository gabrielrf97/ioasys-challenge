//
//  CompaniesViewController.swift
//  ioasys-challenge
//
//  Created by Gabriel on 14/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var companiesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var resultSearchController = UISearchController()
    var companiesViewModel = CompaniesViewModel()
    var cellIdentifier = "CompanyCell"
    var companies = [CompanyInfo]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setupView()
    }
    
    func setupView() {
        companiesTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        companiesViewModel.companiesDelegate = self
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        searchBar.delegate = self
    }
}

extension CompaniesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CompanyCell else {
            return UITableViewCell()
        }
        cell.configure(with: companies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CompanyCell,
            let companyVC = UIStoryboard(name: "Company", bundle: nil).instantiateInitialViewController() as? CompanyViewController else {
            return
        }
        companyVC.company = companies[indexPath.row]
        companyVC.modalPresentationStyle = .fullScreen
        self.present(companyVC, animated: true, completion: {
            cell.setSelected(false, animated: false)
        })
    }
}

extension CompaniesViewController: CompaniesViewDelegate {
    func updateView(companies: [CompanyInfo]) {
        self.companies = companies
        self.companiesTableView.reloadData()
    }
}

extension CompaniesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
             companiesViewModel.fetchCompanies(containing: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        view.endEditing(false)
    }
}

