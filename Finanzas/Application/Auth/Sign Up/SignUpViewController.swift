//
//  SignUpViewController.swift
//  Finanzas
//
//  Created by Usuario on 03/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmedPasswordTextField: UITextField!
    let login = Login()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign up"
    }
    
    @IBAction func btnsignUp() {
        guard login.signUp(user: usernameTextField.text,
                           email: emailTextField.text,
                           password: passwordTextField.text,
                           confirmed: confirmedPasswordTextField.text
            ) else {
                print("No se pudo registrar el usuario")
                return
        }
        self.navigationController?.popViewController(animated: true)
        
        //PRINT PA CONSOLA
        print("Boton registrarse presionado")
        if let username = usernameTextField.text {
            print("Username: \(username)")
        }
        if let email = emailTextField.text {
            print("Email: \(email)")
        }
        if let password = passwordTextField.text {
            print("Password: \(password)")
        }
        if let confirmedPassword = confirmedPasswordTextField.text {
            print("Password confirmado: \(confirmedPassword)")
        }
    }
}
