//
//  Validations.swift
//  Finanzas
//
//  Created by Usuario on 18/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

class Validations <T>{
    var errors: [T]
    
    init() {
        errors = []
    }
    
    func addError(error: T) {
        errors.append(error)
    }
    
    func clearErrors() {
        errors.removeAll()
    }
}
