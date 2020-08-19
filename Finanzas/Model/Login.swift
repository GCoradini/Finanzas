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
    var validations:Validations<LoginErrors>
    
    init(){
        userDefault = UserDefaultManager()
        validations = Validations()
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
        guard let user = users.first(
            where: {$0.username == username && $0.password == password}
            ) else {
                return false
        }
        userDefault.setLoggedUser(user)
        return true
    }
    
    func signUp(
        user registerUsername: String?,
        email registerEmail: String?,
        password registerPassword: String?,
        confirmed confirmedPassword: String?
    ) -> [LoginErrors] {
        
        if let username = registerUsername,
            let email = registerEmail,
            let password = registerPassword,
            let confPassword = confirmedPassword
        {
            if !username.isValidUsername {
                validations.addError(error: .invalidUsername)
            }
            
            if !email.isValidEmail {
                validations.addError(error: .invalidEmail)
            }
            
            if !password.isValidPassword {
                validations.addError(error: .invalidPassword)
            }
            
            if confPassword != registerPassword {
                validations.addError(error: .invalidConfPassword)
            }
            
            if validations.errors.isEmpty {
                userDefault.saveUser(User(username: username, email: email, password: password))
            }
        }
        return validations.errors
    }
    
    func logout() {
        userDefault.clearLoguedUser()
    }
    
    func clearErrors() {
        validations.clearErrors()
    }
}
