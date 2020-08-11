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
    
    func signIn(
        with loginUsername: String?,
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
        guard let user = users.first(
            where: {$0.username == username && $0.password == password}
            ) else {
                return false
        }
        userDefault.setLoguedUser(user)
        return true
    }
    
    func signUp(
        user registerUsername: String?,
        email registerEmail: String?,
        password registerPassword: String?,
        confirmed confirmedPassword: String?
    ) -> [Bool] {
        var validations:[Bool] = []
        
        if let username = registerUsername,
            let email = registerEmail,
            let password = registerPassword,
            let confPassword = confirmedPassword
        {
            validations.append(username.isValidUsername)
            validations.append(email.isValidEmail)
            validations.append(password.isValidPassword)
            validations.append(confPassword == registerPassword)
            
            if !validations.contains(false) {
                userDefault.saveUser(User(username: username, email: email, password: password))
            }
        }
        return validations
    }
}
