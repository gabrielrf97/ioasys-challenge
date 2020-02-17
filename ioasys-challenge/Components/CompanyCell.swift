//
//  TrialCell.swift
//  ioasys-challenge
//
//  Created by Gabriel on 15/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import UIKit
import SDWebImage

class CompanyCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    var id: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.layer.cornerRadius = cellImageView.frame.height/2
        cellImageView.layer.masksToBounds = true
    }
    
    func configure(with info: CompanyInfo) {
        self.id = info.id
        self.titleLabel.text = info.name
        self.subtitleLabel.text = info.location
        if let pictureUrl = info.pictureUrl {
            cellImageView.sd_setImage(with: URL(fileURLWithPath: pictureUrl), placeholderImage: UIImage(named: "smallPlaceholder"), context: nil)
        }
    }
}
