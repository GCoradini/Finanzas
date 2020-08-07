//
//  Login.swift
//  Finanzas
//
//  Created by Usuario on 04/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

public class Login {
    var userDefault:UserDefaultManager
    
    init(){
        userDefault = UserDefaultManager()
    }
    
    func signIn(with loginUsername: String?,
                and loginPassword: String?
    ) -> Bool {
        guard
            let username = loginUsername,
            username.isValidUsername
            else {
                print("Enter a valid username")
                return false
            }
        guard
            let password = loginPassword,
            password.isValidPassword
            else {
                print("Enter a valid password")
                return false
            }
        let users = userDefault.getUsers()
        for user in users {
            if user.username == username && user.password == password {
                userDefault.setLoguedUser(user)
                return true
            }
        }
        return false
    }
    
    func signUp(
        user registerUsername: String?,
        email registerEmail: String?,
        password registerPassword: String?,
        confirmed confirmedPassword: String?
    ) -> Bool {
        guard
            let username = registerUsername,
            username.isValidUsername
            else {
                print("Enter a valid username")
                return false
            }
        guard
            let email = registerEmail,
            email.isValidEmail
            else {
                print("Enter a valid email")
                return false
            }
        guard
            let password = registerPassword,
            password.isValidPassword
            else {
                print("Enter a valid password")
                return false
            }
        guard
            let confPassword = confirmedPassword,
            confPassword.isValidPassword,
            confPassword == password
            else {
                print("Passwords does not match")
                return false
            }
        userDefault.saveUser(User(username: username, email: email, password: password))
        return true
    }
}
