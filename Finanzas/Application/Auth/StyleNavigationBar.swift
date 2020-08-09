//
//  StyleNavigationBar.swift
//  Finanzas
//
//  Created by Usuario on 09/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func setStyleNavigationBar() {
        self.navigationBar.barStyle = .black
        self.navigationBar.isTranslucent = true
        self.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Arial Rounded MT Bold", size: 17)!
        ]
        self.navigationBar.tintColor = UIColor.orange
    }
}
