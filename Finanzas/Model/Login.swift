//
//  Login.swift
//  Finanzas
//
//  Created by Usuario on 04/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

public class Login {
    var userDefault:UserDefaultManager  //HACER ESTA VARIABLE PRIVADA
    
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
                return false
        }
        guard
            let password = loginPassword,
            password.isValidPassword
            else {
                return false
        }
        let users = userDefault.getUsers()
        guard let _ = users.first(
            where: {$0.username == username && $0.password == password}
            ) else {
                return false
        }
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
