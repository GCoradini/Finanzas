//
//  LoginViewController.swift
//  Finanzas
//
//  Created by MAC on 26/07/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    // MARK: - Views -
    @IBOutlet var usernameTxtField: UITextField!
    @IBOutlet var passwordTxtField: UITextField!
    
    // MARK: - Attributes -
    let login = Login()
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.navigationController?.setStyleNavigationBar()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        usernameTxtField.text = ""
        passwordTxtField.text = ""
    }
    
    // MARK: - Sign Up Action -
    @IBAction func btnSignUp() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    // MARK: - Login Action -
    @IBAction func btnLogin() {

        guard login.signIn(
            with: usernameTxtField.text,
            and: passwordTxtField.text
            ) else {
                self.alert(
                    message: "Incorrect username or password",
                    title:"Login error",
                    handler: nil
                )
                return
        }
        guard let user = usernameTxtField.text else {
            return
        }
        let view = BudgetViewController(username: user)
        self.navigationController?.pushViewController(view, animated: true)
    }
}
