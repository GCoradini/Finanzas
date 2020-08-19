//
//  TypeErrors.swift
//  Finanzas
//
//  Created by Usuario on 18/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

enum LoginErrors {
    case invalidUsername
    case invalidEmail
    case invalidPassword
    case invalidConfPassword
}

enum TransactionErrors {
    case titleEmpty
    case descriptionEmpty
    case invalidAmount
}
