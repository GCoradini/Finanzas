//
//  User.swift
//  Finanzas
//
//  Created by Usuario on 04/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

//hacer los atributos privados
struct User: Codable {
    var username: String
    var email: String
    var password: String
    var transactions: [Transaction]
    
    init(username: String, email: String, password: String){
        self.username = username
        self.email = email
        self.password = password
        self.transactions = []
    }
}

