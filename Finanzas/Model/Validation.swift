//
//  Extension.swift
//  Finanzas
//
//  Created by Usuario on 05/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regex = "[A-Za-z0-9_//-]{1,20}+@[a-z]+\\.com"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    var isValidUsername: Bool {
        let regex = "[A-Z0a-z_//-]{3,15}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    var isValidPassword: Bool {
        let regex = "[A-Za-z0-9]{8,20}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    var isValidAmount: Bool {
        let regex = "[0-9]{1,}\\.[0-9]{1,}|[0-9]{1,}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
