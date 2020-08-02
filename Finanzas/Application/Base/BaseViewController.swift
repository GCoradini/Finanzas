//
//  ViewController.swift
//  Finanzas
//
//  Created by MAC on 26/07/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(
            nibName: String(describing: type(of: self)),
            bundle: nil
        )
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

