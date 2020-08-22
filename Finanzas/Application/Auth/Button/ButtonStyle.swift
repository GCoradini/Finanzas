//
//  ButtonStyle.swift
//  Finanzas
//
//  Created by Usuario on 21/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

extension UIButton {
    
    func disable() {
        self.backgroundColor = UIColor.darkGray
        self.isEnabled = false
    }
    
    func enable() {
        self.backgroundColor = UIColor.orange
        self.isEnabled = true
    }
}
