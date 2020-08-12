//
//  LoginViewController.swift
//  Finanzas
//
//  Created by MAC on 26/07/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    @IBOutlet var usernameTxtField: UITextField!
    @IBOutlet var passwordTxtField: UITextField!
    
    let login = Login()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.navigationController?.setStyleNavigationBar()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        usernameTxtField.text = ""
        passwordTxtField.text = ""
    }
    
    @IBAction func btnSignUp() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
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
        self.navigationController?.pushViewController(BudgetViewController(), animated: true)
    }
    
    /*
    ///Borrar esto
    @IBAction func borrarDatos() {
        login.userDefault.clearUsers()
    }*/
}
