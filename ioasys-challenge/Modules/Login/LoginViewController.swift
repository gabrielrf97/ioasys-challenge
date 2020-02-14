//
//  LoginViewController.swift
//  ioasys-challenge
//
//  Created by Gabriel on 14/02/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var hideButton: UIButton!
    
    var passwordHidden = false
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loginViewModel.viewDelegate = self
    }
    
    func setupView() {
        emailTF.attributedPlaceholder = NSAttributedString(string: "insert your email",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
      
        passwordTF.attributedPlaceholder = NSAttributedString(string: "insert your password",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        loginBtn.layer.cornerRadius = 12
        loginBtn.layer.masksToBounds = true
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
//        Create a static validatable class or put static method in model
        guard let email = emailTF.text, let password = passwordTF.text else {
            return
        }
        loginViewModel.tryLogin(with: email, password: password)
    }
    
    @IBAction func eyeTapped(_ sender: Any) {
        passwordHidden = !passwordHidden
        passwordTF.isSecureTextEntry = passwordHidden
        if passwordHidden {
            hideButton.setBackgroundImage(UIImage(named: "hidden"), for: .normal)
        } else {
            hideButton.setBackgroundImage(UIImage(named: "eye"), for: .normal)
            
        }
    }
    
}

extension LoginViewController: LoginViewDelegate {
  
    func performedLoginSucessfuly() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        guard let dashboardVC = storyboard.instantiateInitialViewController() else {
//            Present error message
            return
        }
        self.present(dashboardVC, animated: true, completion: nil)
    }
    
    func loginAttemptFailed(with errorMessage: String) {
        
    }
    
    func fieldValidationFailed(errors: [String]) {
        guard let emailError = errors.first, let passwordError = errors.last else {
            return // present error message
        }
        if !emailError.isEmpty {
            emailTF.text = ""
            emailTF.attributedPlaceholder = NSAttributedString(string: emailError,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
        if !passwordError.isEmpty {
            passwordTF.text = ""
            passwordTF.attributedPlaceholder = NSAttributedString(string: passwordError,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
    }
    
    func startedLogin() {
        
    }
}
