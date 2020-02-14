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
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loginViewModel.viewDelegate = self
    }
    
    func setupView() {
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
    
    func fieldValidationFailed(erros: [String]) {
          
    }
}
