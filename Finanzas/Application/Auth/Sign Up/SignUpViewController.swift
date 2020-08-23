//
//  SignUpViewController.swift
//  Finanzas
//
//  Created by Usuario on 03/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Views -
    @IBOutlet private var usernameErrorLbl: UILabel!
    @IBOutlet private var emailErrorLbl: UILabel!
    @IBOutlet private var passwordErrorLbl: UILabel!
    @IBOutlet private var confPasswordErrorLbl: UILabel!
    @IBOutlet private var usernameTF: UITextField!
    @IBOutlet private var emailTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    @IBOutlet private var confirmedPasswordTF: UITextField!
    
    // MARK: - Attributes -
    private let login = Login()
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign up"
    }
    
    // MARK: - Sign Up Action -
    @IBAction func btnsignUp() {
        
        let validations = login.signUp(
            user: usernameTF.text,
            email: emailTF.text,
            password: passwordTF.text,
            confirmed: confirmedPasswordTF.text
        )
        clearErrors()
        
        for error in validations {
            switch error {
            case .invalidUsername:
                usernameErrorLbl.setErrorMessage(message: "username is not valid")
                break
            case .invalidEmail:
                emailErrorLbl.setErrorMessage(message: "email is not valid")
                break
            case .invalidPassword:
                passwordErrorLbl.setErrorMessage(message: "password is not valid")
                break
            case .invalidConfPassword:
                confPasswordErrorLbl.setErrorMessage(message: "password doesn't match")
                break
            case .saveError:
                self.alert(
                    message: "Can´t create your account" ,
                    title: "Save Error",
                    handler: {_ in self.navigationController?.popViewController(animated: true)}
                )
            }
        }
        
        guard validations.isEmpty else {
            login.clearErrors()
            return
        }
        clearErrors()
        
        self.alert(
            message: "Your account has been created successfully" ,
            title: "Congratulations",
            handler: {_ in self.navigationController?.popViewController(animated: true)}
        )
        
    }
    
    // MARK: - Clear errors -
    private func clearErrors() {
        usernameErrorLbl.clearErrorMessage()
        emailErrorLbl.clearErrorMessage()
        passwordErrorLbl.clearErrorMessage()
        confPasswordErrorLbl.clearErrorMessage()
    }
}
