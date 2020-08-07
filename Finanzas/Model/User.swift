//
//  User.swift
//  Finanzas
//
//  Created by Usuario on 04/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

//User, que sea un struct, mirar
class User: Codable {
    var username: String
    var email: String
    var password: String
    
    init(username: String, email: String, password: String){
        self.username = username
        self.email = email
        self.password = password
    }
}

