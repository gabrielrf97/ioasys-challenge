//
//  CompanyViewController.swift
//  ioasys-challenge
//
//  Created by Gabriel on 15/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {

    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    let companyViewModel = CompanyViewModel()
    var companyId = 0
    
    override func loadView() {
        super.loadView()
        descriptionLabel.sizeToFit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
