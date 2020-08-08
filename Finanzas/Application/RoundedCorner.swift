//
//  RoundedButton.swift
//  Finanzas
//
//  Created by Usuario on 07/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

extension UIControl {
    func setRoundedCorner() {
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    }
}
