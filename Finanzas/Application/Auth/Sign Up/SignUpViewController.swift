//
//  SignUpViewController.swift
//  Finanzas
//
//  Created by Usuario on 03/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var usernameErrorLbl: UILabel!
    @IBOutlet var emailErrorLbl: UILabel!
    @IBOutlet var passwordErrorLbl: UILabel!
    @IBOutlet var confPasswordErrorLbl: UILabel!
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmedPasswordTF: UITextField!
    let login = Login()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign up"
    }
    
    @IBAction func btnsignUp() {
        
        let validations = login.signUp(
            user: usernameTF.text,
            email: emailTF.text,
            password: passwordTF.text,
            confirmed: confirmedPasswordTF.text
        )
        
        //probar cambiar estos ifs
        guard !validations.contains(false) else {
            if validations[0] {
                usernameErrorLbl.clearErrorMessage()
            } else {
                usernameErrorLbl.setErrorMessage(message: "username is not valid")
            }
            
            if validations[1] {
                emailErrorLbl.clearErrorMessage()
            } else {
                emailErrorLbl.setErrorMessage(message: "email is not valid")
            }
            
            if validations[2] {
                passwordErrorLbl.clearErrorMessage()
            } else {
                passwordErrorLbl.setErrorMessage(message: "password is not valid")
            }
            
            if validations[3] {
                confPasswordErrorLbl.clearErrorMessage()
            } else {
                confPasswordErrorLbl.setErrorMessage(message: "password doesn't match")
            }
            return
        }
        usernameErrorLbl.clearErrorMessage()
        emailErrorLbl.clearErrorMessage()
        passwordErrorLbl.clearErrorMessage()
        confPasswordErrorLbl.clearErrorMessage()
        
        self.alert(
            message: "Congratulations",
            title:"Your account has been created successfully",
            handler: {_ in self.navigationController?.popViewController(animated: true)}
        )
        
    }
}
