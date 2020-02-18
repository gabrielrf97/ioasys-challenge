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
    @IBOutlet weak var typeWidth: NSLayoutConstraint!
    
    var company: CompanyInfo!
    
    override func loadView() {
        super.loadView()
        descriptionLabel.sizeToFit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        typeWidth.constant = getIdealSize()
        self.view.layoutIfNeeded()
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
    }
    
    func getIdealSize() -> CGFloat {
        let label = UILabel(frame: .zero)
        label.text = company.type
        label.sizeToFit()
        return label.frame.size.width + 30
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
