//
//  LoginViewController.swift
//  Finanzas
//
//  Created by MAC on 26/07/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    @IBOutlet var usernameTxtField: UITextField!;
    @IBOutlet var passwordTxtField: UITextField!;
    let login = Login()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Arial Rounded MT Bold", size: 17)!
        ]
        self.navigationController!.navigationBar.tintColor = UIColor.orange
    }
    
    @IBAction func btnSignUp() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
        print("Registrarse presionado")
    }
    
    @IBAction func btnLogin() {
        guard login.signIn(with: usernameTxtField.text,
                           and: passwordTxtField.text
        ) else {
            print("Usuario o contraseña incorrecta")
            return
        }
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
        
        //PA MOSTRAR POR CONSOLA
        print("Login presionado")
        if let username = usernameTxtField.text {
            print("Username: \(username)")
        }
        
        if let password = passwordTxtField.text {
            print(password)
        }
    }
    
    ///Borrar esto
    @IBAction func borrarDatos() {
        login.userDefault.clearUsers()
    }
}
