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
        self.hideKeyboardWhenTappedAround()
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
        let storyboard = UIStoryboard(name: "Companies", bundle: nil)
        guard let companiesVC = storyboard.instantiateInitialViewController() else {
            self.presentMessage(with: "Opa",body: "Ocorreu um erro e não conseguiremos fazer login", option: "Tente novamente")
            return
        }
        companiesVC.modalPresentationStyle = .fullScreen
        self.present(companiesVC, animated: true, completion: nil)
    }
    
    func loginAttemptFailed(with errorMessage: String) {
        self.presentMessage(with: "Opa", body: errorMessage, option: "Cancelar")
    }
    
    func fieldValidationFailed(errors: [String]) {
        guard let emailError = errors.first, let passwordError = errors.last else {
            return
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
}
