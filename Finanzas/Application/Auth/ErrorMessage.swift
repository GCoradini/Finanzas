//
//  ErrorMessage.swift
//  Finanzas
//
//  Created by Usuario on 11/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

extension UILabel {
    func setErrorMessage(message: String) {
        self.text = message
    }
    
    func clearErrorMessage() {
        self.text = ""
    }
}
