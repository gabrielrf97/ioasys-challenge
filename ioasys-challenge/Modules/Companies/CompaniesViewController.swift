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
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var companiesTableView: UITableView!
    
//    var companiesViewModel:
    var cellIdentifier = "CompanyCell"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        companiesTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        var keyWindow = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
    }

}

extension CompaniesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CompanyCell else {
            return UITableViewCell()
        }
//        cell.titleLbl.text = "Google LLC"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CompanyCell,
            let companyVC = UIStoryboard(name: "Company", bundle: nil).instantiateInitialViewController() as? CompanyViewController else {
            return
        }
        companyVC.companyId = cell.id
        companyVC.modalPresentationStyle = .fullScreen
        self.present(companyVC, animated: true, completion: {
            cell.setSelected(false, animated: false)
        })
    }
    
    
}
