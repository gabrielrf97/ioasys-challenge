//
//  UITextFieldExt.swift
//  ioasys-challenge
//
//  Created by Gabriel on 18/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setplaceHolderColor(color: UIColor, text: String) {
        self.attributedPlaceholder = NSAttributedString(string: text,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    func setPlaceholderToError(text: String) {
        self.attributedPlaceholder = NSAttributedString(string: text,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    }
}
