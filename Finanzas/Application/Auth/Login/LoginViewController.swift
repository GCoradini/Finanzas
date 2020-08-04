//
//  LoginViewController.swift
//  Finanzas
//
//  Created by MAC on 26/07/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    @IBOutlet var loginButton: UIButton!;
    @IBOutlet var signUpButton: UIButton!;
    @IBOutlet var usernameTxtField: UITextField!;
    @IBOutlet var passwordTxtField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSignUp() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}
