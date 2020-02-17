//
//  CompanyViewController.swift
//  ioasys-challenge
//
//  Created by Gabriel on 15/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var companyType: UILabel!
    
    var company: CompanyInfo!
    
    override func loadView() {
        super.loadView()
        descriptionLabel.sizeToFit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        changeTextViewSize()
    }
    
    func setupView() {
        if let _pictureUrl = company.pictureUrl {
                   companyImageView.sd_setImage(with: URL(fileURLWithPath: _pictureUrl), placeholderImage: UIImage(named: "companyPlaceholder"), context: nil)
               }
        nameLabel.text = company.name
        locationLabel.text = company.location
        descriptionLabel.text = company.description
       
        companyType.text = company.type
        companyType.layer.cornerRadius = 8
        companyType.layer.masksToBounds = true
        companyType.frame.size.width = changeTextViewSize()
        
        view.layoutIfNeeded()
    }
    
    func changeTextViewSize() -> CGFloat {
        let txtField = UITextField(frame: .zero)
        txtField.text = company.type
        txtField.sizeToFit()
        return txtField.frame.size.width + 40
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
